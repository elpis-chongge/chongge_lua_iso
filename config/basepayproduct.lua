BasePayProduct = {
  [25000001] = {
    id = 25000001,
    product_id = "cn.haoplay.elpis.diamond1",
    name = function()
      return T(80615001)
    end,
    icon = "Shop:Recharge_1",
    type = 1,
    price = 6,
    diamond = 1,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 1,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 0,
    sell_limit_max = -1,
    sell_level = {1, 999},
    sort = 1,
    shop_group = 1,
    refund_deduction = 1
  },
  [25000002] = {
    id = 25000002,
    product_id = "cn.haoplay.elpis.diamond2",
    name = function()
      return T(80615002)
    end,
    icon = "Shop:Recharge_2",
    type = 1,
    price = 30,
    diamond = 5,
    bindDiamond = 0,
    extra_diamond = 1,
    extra_bindDiamond = 0,
    first_diamond = 4,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 0,
    sell_limit_max = -1,
    sell_level = {1, 999},
    sort = 2,
    shop_group = 1,
    refund_deduction = 6
  },
  [25000003] = {
    id = 25000003,
    product_id = "cn.haoplay.elpis.diamond3",
    name = function()
      return T(80615003)
    end,
    icon = "Shop:Recharge_3",
    type = 1,
    price = 98,
    diamond = 16,
    bindDiamond = 0,
    extra_diamond = 4,
    extra_bindDiamond = 0,
    first_diamond = 12,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 0,
    sell_limit_max = -1,
    sell_level = {1, 999},
    sort = 3,
    shop_group = 1,
    refund_deduction = 20
  },
  [25000004] = {
    id = 25000004,
    product_id = "cn.haoplay.elpis.diamond4",
    name = function()
      return T(80615004)
    end,
    icon = "Shop:Recharge_4",
    type = 1,
    price = 198,
    diamond = 33,
    bindDiamond = 0,
    extra_diamond = 8,
    extra_bindDiamond = 0,
    first_diamond = 25,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 0,
    sell_limit_max = -1,
    sell_level = {1, 999},
    sort = 4,
    shop_group = 1,
    refund_deduction = 41
  },
  [25000005] = {
    id = 25000005,
    product_id = "cn.haoplay.elpis.diamond5",
    name = function()
      return T(80615005)
    end,
    icon = "Shop:Recharge_5",
    type = 1,
    price = 328,
    diamond = 55,
    bindDiamond = 0,
    extra_diamond = 13,
    extra_bindDiamond = 0,
    first_diamond = 42,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 0,
    sell_limit_max = -1,
    sell_level = {1, 999},
    sort = 5,
    shop_group = 1,
    refund_deduction = 68
  },
  [25000006] = {
    id = 25000006,
    product_id = "cn.haoplay.elpis.diamond6",
    name = function()
      return T(80615006)
    end,
    icon = "Shop:Recharge_6",
    type = 1,
    price = 648,
    diamond = 110,
    bindDiamond = 0,
    extra_diamond = 30,
    extra_bindDiamond = 0,
    first_diamond = 80,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 0,
    sell_limit_max = -1,
    sell_level = {1, 999},
    sort = 6,
    shop_group = 1,
    refund_deduction = 140
  },
  [25000101] = {
    id = 25000101,
    product_id = "cn.haoplay.elpis.month2",
    name = function()
      return T(80615101)
    end,
    des = {80616011, 80616012},
    icon = "ShopPic:ShopGiftMonth_1000",
    icon_pic = "ShopPic:ShopPicMonth_1001",
    type = 2,
    month_card_type = 1,
    quality = 3,
    price = 30,
    diamond = 6,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_rewards = {
      "1:21110003:2"
    },
    day_diamond = 0,
    day_bindDiamond = 150,
    sell_limit_type = 5,
    sell_limit_max = 62,
    sell_level = {1, 999},
    sort = 1,
    shop_group = 2,
    banner_group = 2,
    rule_des = {
      80616001,
      80616002,
      80616003,
      80616004
    },
    refund_deduction = 6,
    buy_return = 6
  },
  [25000201] = {
    id = 25000201,
    product_id = "cn.haoplay.elpis.pack1",
    name = function()
      return T(80615201)
    end,
    icon = "ShopPic:ShopGift_1001",
    type = 3,
    quality = 0,
    price = 6,
    rewards = {
      "1:21090002:1",
      "1:21000003:20000",
      "1:21010001:20000"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 47,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 1,
    buy_return = 1,
    sell_type = function()
      return T(80633001)
    end
  },
  [25000202] = {
    id = 25000202,
    product_id = "cn.haoplay.elpis.pack11",
    name = function()
      return T(80615202)
    end,
    icon = "ShopPic:ShopGift_1002",
    type = 3,
    quality = 1,
    price = 30,
    rewards = {
      "1:21000003:150000",
      "1:21090004:1"
    },
    diamond = 5,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 51,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 6,
    buy_return = 6,
    sell_type = function()
      return T(80633002)
    end
  },
  [25000203] = {
    id = 25000203,
    product_id = "cn.haoplay.elpis.pack3",
    name = function()
      return T(80615203)
    end,
    icon = "ShopPic:ShopGift_1003",
    type = 3,
    quality = 2,
    price = 45,
    rewards = {
      "1:21100004:10"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 55,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 9,
    buy_return = 9,
    sell_type = function()
      return T(80633003)
    end
  },
  [25000204] = {
    id = 25000204,
    product_id = "cn.haoplay.elpis.pack4",
    name = function()
      return T(80615204)
    end,
    icon = "ShopPic:ShopGift_1004",
    type = 3,
    quality = 2,
    price = 68,
    rewards = {
      "1:21070003:1"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 57,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 14,
    buy_return = 13,
    sell_type = function()
      return T(80633004)
    end
  },
  [25000205] = {
    id = 25000205,
    product_id = "cn.haoplay.elpis.pack5",
    name = function()
      return T(80615205)
    end,
    icon = "ShopPic:ShopGift_1005",
    type = 3,
    quality = 3,
    price = 128,
    rewards = {
      "1:21100004:20"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 58,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 26,
    buy_return = 26,
    sell_type = function()
      return T(80633005)
    end
  },
  [25000206] = {
    id = 25000206,
    product_id = "cn.haoplay.elpis.pack6",
    name = function()
      return T(80615206)
    end,
    icon = "ShopPic:ShopGift_1014",
    type = 3,
    quality = 2,
    price = 45,
    rewards = {
      "1:21100001:10"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 56,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 9,
    buy_return = 9,
    sell_type = function()
      return T(80633006)
    end
  },
  [25000207] = {
    id = 25000207,
    product_id = "cn.haoplay.elpis.pack7",
    name = function()
      return T(80615207)
    end,
    icon = "ShopPic:ShopGift_1015",
    type = 3,
    quality = 3,
    price = 128,
    rewards = {
      "1:21100001:20"
    },
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 59,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 26,
    buy_return = 26,
    sell_type = function()
      return T(80633007)
    end
  },
  [25000208] = {
    id = 25000208,
    product_id = "cn.haoplay.elpis.pack8",
    name = function()
      return T(80615208)
    end,
    icon = "ShopPic:ShopGift_1017",
    type = 3,
    quality = 2,
    price = 6,
    rewards = {
      "1:21090055:1",
      "1:21010104:5"
    },
    diamond = 0,
    bindDiamond = 120,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 52,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 1,
    buy_return = 1,
    sell_type = function()
      return T(80633008)
    end
  },
  [25000209] = {
    id = 25000209,
    product_id = "cn.haoplay.elpis.pack9",
    name = function()
      return T(80615209)
    end,
    icon = "ShopPic:ShopGift_1018",
    type = 3,
    quality = 2,
    price = 6,
    rewards = {
      "1:21090056:1",
      "1:21010104:5"
    },
    diamond = 0,
    bindDiamond = 120,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 53,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 1,
    buy_return = 1,
    sell_type = function()
      return T(80633009)
    end
  },
  [25000210] = {
    id = 25000210,
    product_id = "cn.haoplay.elpis.pack10",
    name = function()
      return T(80615210)
    end,
    icon = "ShopPic:ShopGift_1019",
    type = 3,
    quality = 2,
    price = 6,
    rewards = {
      "1:21090057:1",
      "1:21010104:5"
    },
    diamond = 0,
    bindDiamond = 120,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 54,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 1,
    buy_return = 1,
    sell_type = function()
      return T(80633010)
    end
  },
  [25000211] = {
    id = 25000211,
    product_id = "cn.haoplay.elpis.daily1",
    name = function()
      return T(80615211)
    end,
    icon = "ShopPic:ShopGift_1007",
    type = 3,
    quality = 0,
    price = 6,
    rewards = {
      "1:21100004:1"
    },
    diamond = 0,
    bindDiamond = 60,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 1,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 51,
    shop_group = 2,
    banner_group = 2,
    refund_deduction = 1,
    buy_return = 1,
    sell_type = function()
      return T(80633011)
    end
  },
  [25000221] = {
    id = 25000221,
    product_id = "cn.haoplay.elpis.weekly1",
    name = function()
      return T(80615221)
    end,
    icon = "ShopPic:ShopGift_1008",
    type = 3,
    quality = 1,
    price = 18,
    rewards = {
      "1:21000003:300000"
    },
    diamond = 0,
    bindDiamond = 200,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 2,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 52,
    shop_group = 2,
    banner_group = 2,
    refund_deduction = 3,
    buy_return = 3,
    sell_type = function()
      return T(80633012)
    end
  },
  [25000222] = {
    id = 25000222,
    product_id = "cn.haoplay.elpis.weekly2",
    name = function()
      return T(80615222)
    end,
    icon = "ShopPic:ShopGift_1009",
    type = 3,
    quality = 1,
    price = 18,
    rewards = {
      "1:21010001:280000"
    },
    diamond = 0,
    bindDiamond = 200,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 2,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 53,
    shop_group = 2,
    banner_group = 2,
    refund_deduction = 3,
    buy_return = 3,
    sell_type = function()
      return T(80633013)
    end
  },
  [25000223] = {
    id = 25000223,
    product_id = "cn.haoplay.elpis.weekly3",
    name = function()
      return T(80615223)
    end,
    icon = "ShopPic:ShopGift_1010",
    type = 3,
    quality = 3,
    price = 30,
    rewards = {
      "1:21100004:5"
    },
    diamond = 0,
    bindDiamond = 300,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 2,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 54,
    shop_group = 2,
    banner_group = 2,
    refund_deduction = 6,
    buy_return = 6,
    sell_type = function()
      return T(80633014)
    end
  },
  [25000231] = {
    id = 25000231,
    product_id = "cn.haoplay.elpis.monthly1",
    name = function()
      return T(80615231)
    end,
    icon = "ShopPic:ShopGift_1011",
    type = 3,
    quality = 2,
    price = 45,
    rewards = {
      "1:21000003:800000"
    },
    diamond = 0,
    bindDiamond = 500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 3,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 55,
    shop_group = 2,
    banner_group = 2,
    refund_deduction = 9,
    buy_return = 9,
    sell_type = function()
      return T(80633015)
    end
  },
  [25000232] = {
    id = 25000232,
    product_id = "cn.haoplay.elpis.monthly2",
    name = function()
      return T(80615232)
    end,
    icon = "ShopPic:ShopGift_1012",
    type = 3,
    quality = 2,
    price = 45,
    rewards = {
      "1:21010001:720000"
    },
    diamond = 0,
    bindDiamond = 500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 3,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 56,
    shop_group = 2,
    banner_group = 2,
    refund_deduction = 9,
    buy_return = 9,
    sell_type = function()
      return T(80633016)
    end
  },
  [25000233] = {
    id = 25000233,
    product_id = "cn.haoplay.elpis.monthly3",
    name = function()
      return T(80615233)
    end,
    icon = "ShopPic:ShopGift_1013",
    type = 3,
    quality = 3,
    price = 128,
    rewards = {
      "1:21100004:10"
    },
    diamond = 0,
    bindDiamond = 3000,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 3,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 49,
    shop_group = 2,
    banner_group = 2,
    refund_deduction = 26,
    buy_return = 26,
    sell_type = function()
      return T(80633017)
    end
  },
  [25000234] = {
    id = 25000234,
    product_id = "cn.haoplay.elpis.monthly4",
    name = function()
      return T(80615234)
    end,
    icon = "ShopPic:ShopGift_1016",
    type = 3,
    quality = 3,
    price = 128,
    rewards = {
      "1:21100001:10"
    },
    bindDiamond = 3000,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 3,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 50,
    shop_group = 2,
    banner_group = 2,
    refund_deduction = 26,
    buy_return = 26,
    sell_type = function()
      return T(80633018)
    end
  },
  [25000301] = {
    id = 25000301,
    product_id = "cn.haoplay.elpis.pass101",
    name = function()
      return T(80615301)
    end,
    type = 4,
    passport_id = 70040010,
    price = 68,
    rewards = {
      "4:12001073:1"
    },
    diamond = 0,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    exclusion = {25000302},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000302] = {
    id = 25000302,
    product_id = "cn.haoplay.elpis.pass102",
    name = function()
      return T(80615302)
    end,
    type = 6,
    passport_id = 70040010,
    price = 98,
    rewards = {
      "4:12001073:1",
      "1:21000007:300"
    },
    diamond = 6,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    exclusion = {25000301, 25000303},
    refund_deduction = 20,
    buy_return = 20
  },
  [25000303] = {
    id = 25000303,
    product_id = "cn.haoplay.elpis.pass103",
    name = function()
      return T(80615303)
    end,
    type = 7,
    passport_id = 70040010,
    price = 30,
    rewards = {
      "1:21000007:300"
    },
    diamond = 6,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    pre = {25000301},
    exclusion = {25000302},
    refund_deduction = 6,
    buy_return = 6
  },
  [25000304] = {
    id = 25000304,
    product_id = "cn.haoplay.elpis.pass104",
    name = function()
      return T(80615301)
    end,
    type = 4,
    passport_id = 70040020,
    price = 68,
    rewards = {
      "4:12001463:1"
    },
    diamond = 0,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    exclusion = {25000305},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000305] = {
    id = 25000305,
    product_id = "cn.haoplay.elpis.pass105",
    name = function()
      return T(80615302)
    end,
    type = 6,
    passport_id = 70040020,
    price = 98,
    rewards = {
      "4:12001463:1",
      "1:21000007:300"
    },
    diamond = 6,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    exclusion = {25000304, 25000306},
    refund_deduction = 20,
    buy_return = 20
  },
  [25000306] = {
    id = 25000306,
    product_id = "cn.haoplay.elpis.pass106",
    name = function()
      return T(80615303)
    end,
    type = 7,
    passport_id = 70040020,
    price = 30,
    rewards = {
      "1:21000007:300"
    },
    diamond = 6,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    pre = {25000304},
    exclusion = {25000305},
    refund_deduction = 6,
    buy_return = 6
  },
  [25000401] = {
    id = 25000401,
    product_id = "cn.haoplay.elpis.pass001",
    name = function()
      return T(80615401)
    end,
    type = 8,
    price = 6,
    diamond = 0,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 2,
    sell_limit_max = 1,
    sell_level = {1, 999},
    refund_deduction = 1,
    buy_return = 1
  },
  [25000501] = {
    id = 25000501,
    product_id = "cn.haoplay.elpis.pass201",
    name = function()
      return T(80615301)
    end,
    type = 4,
    passport_id = 70041010,
    price = 68,
    rewards = {
      "4:12001703:1"
    },
    diamond = 0,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000502] = {
    id = 25000502,
    product_id = "cn.haoplay.elpis.pass202",
    name = function()
      return T(80615301)
    end,
    type = 4,
    passport_id = 70041020,
    price = 68,
    rewards = {
      "4:12001613:1"
    },
    diamond = 0,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000503] = {
    id = 25000503,
    product_id = "cn.haoplay.elpis.pass203",
    name = function()
      return T(80615301)
    end,
    type = 4,
    passport_id = 70041030,
    price = 68,
    rewards = {
      "4:12001803:1"
    },
    diamond = 0,
    bindDiamond = 1500,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    refund_deduction = 14,
    buy_return = 13
  },
  [25000601] = {
    id = 25000601,
    product_id = "cn.haoplay.elpis.eventpack1",
    name = function()
      return T(80615601)
    end,
    icon = "ShopPic:ShopGift_1020",
    type = 3,
    quality = 3,
    price = 30,
    rewards = {
      "1:21100004:5"
    },
    diamond = 0,
    bindDiamond = 300,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 48,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 6,
    buy_return = 6,
    sell_type = function()
      return T(80633000, 300)
    end
  },
  [25000602] = {
    id = 25000602,
    product_id = "cn.haoplay.elpis.eventpack2",
    name = function()
      return T(80615602)
    end,
    icon = "ShopPic:ShopGift_1021",
    type = 3,
    quality = 3,
    price = 128,
    rewards = {
      "1:21100004:10"
    },
    diamond = 0,
    bindDiamond = 3000,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 49,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 26,
    buy_return = 26,
    sell_type = function()
      return T(80633000, 240)
    end
  },
  [25000603] = {
    id = 25000603,
    product_id = "cn.haoplay.elpis.eventpack3",
    name = function()
      return T(80615603)
    end,
    icon = "ShopPic:ShopGift_1022",
    type = 3,
    quality = 2,
    price = 30,
    rewards = {
      "1:21000003:150000",
      "1:21090004:1"
    },
    diamond = 5,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 50,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 6,
    buy_return = 6,
    sell_type = function()
      return T(80633000, 330)
    end
  },
  [25000604] = {
    id = 25000604,
    product_id = "cn.haoplay.elpis.eventpack1",
    name = function()
      return T(80615601)
    end,
    icon = "ShopPic:ShopGift_1020",
    type = 3,
    quality = 3,
    price = 30,
    rewards = {
      "1:21100004:5"
    },
    diamond = 0,
    bindDiamond = 300,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 48,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 6,
    buy_return = 6,
    sell_type = function()
      return T(80633000, 300)
    end
  },
  [25000605] = {
    id = 25000605,
    product_id = "cn.haoplay.elpis.eventpack2",
    name = function()
      return T(80615602)
    end,
    icon = "ShopPic:ShopGift_1021",
    type = 3,
    quality = 3,
    price = 128,
    rewards = {
      "1:21100004:10"
    },
    diamond = 0,
    bindDiamond = 3000,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 49,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 26,
    buy_return = 26,
    sell_type = function()
      return T(80633000, 240)
    end
  },
  [25000606] = {
    id = 25000606,
    product_id = "cn.haoplay.elpis.eventpack3",
    name = function()
      return T(80615603)
    end,
    icon = "ShopPic:ShopGift_1022",
    type = 3,
    quality = 2,
    price = 30,
    rewards = {
      "1:21000003:150000",
      "1:21090004:1"
    },
    diamond = 5,
    bindDiamond = 0,
    extra_diamond = 0,
    extra_bindDiamond = 0,
    first_diamond = 0,
    first_bindDiamond = 0,
    day_diamond = 0,
    day_bindDiamond = 0,
    sell_limit_type = 4,
    sell_limit_max = 1,
    sell_level = {1, 999},
    sort = 50,
    is_backstage = 1,
    shop_group = 2,
    banner_group = 1,
    refund_deduction = 6,
    buy_return = 6,
    sell_type = function()
      return T(80633000, 330)
    end
  }
}
