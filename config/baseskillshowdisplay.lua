BaseSkillShowDisplay = {
  [42810001] = {
    id = 42810001,
    bullet_effect = "10003/FX_10003_skill1_bullet.prefab",
    bullet_hit_effect = "10003/FX_10003_skill1_hit.prefab",
    bullet_scale = 5000,
    bend_scale = {1},
    bullet_speed = 300,
    max_distance = 200
  },
  [42810002] = {
    id = 42810002,
    bullet_effect = "10003/FX_10003_skill1_bullet.prefab",
    bullet_hit_effect = "10003/FX_10003_skill1_hit.prefab",
    bullet_scale = 5000,
    bend_scale = {3},
    bullet_speed = 300
  },
  [42110151] = {
    id = 42110151,
    hurt_point = {
      "13:42110101:71010104",
      "19:42110102:71010104"
    },
    spine_state = "skill1_1",
    effect = "10001/FX_10001_skill1_1.prefab",
    remote_effect = "100:10001/FX_10001_skill1_bullet.prefab",
    hit_effect = "10001/FX_10001_skill1_hit.prefab",
    sound = {
      71010101,
      71010102,
      71010103
    }
  },
  [42110152] = {
    id = 42110152,
    hurt_point = {
      "13:42110101:71010109",
      "19:42110102:71010109"
    },
    spine_state = "skill1_2",
    effect = "10001/FX_10001_skill1_2.prefab",
    remote_effect = "100:10001/FX_10001_skill1_bullet.prefab",
    hit_effect = "10001/FX_10001_skill1_hit.prefab",
    sound = {
      71010105,
      71010106,
      71010107,
      71010108
    }
  },
  [42310151] = {
    id = 42310151,
    hurt_point = {
      "7:42310101:71010118",
      "10:42310102:71010118",
      "13:42310103:71010118",
      "16:42310104:71010118",
      "19:42310105:71010118",
      "21:42310106:71010118",
      "25:42310107:71010118",
      "55:42310108:71010118"
    },
    spine_state = "skill3",
    effect = "10001/FX_10001_skill3.prefab",
    prepare_effect = "10001/FX_10001_skill3_prepare.prefab",
    hit_effect_list = {
      "10001/FX_10001_skill3_hit_01.prefab",
      "10001/FX_10001_skill3_hit_01.prefab",
      "10001/FX_10001_skill3_hit_01.prefab",
      "10001/FX_10001_skill3_hit_01.prefab",
      "10001/FX_10001_skill3_hit_01.prefab",
      "10001/FX_10001_skill3_hit_01.prefab",
      "10001/FX_10001_skill3_hit_01.prefab",
      "10001/FX_10001_skill3_hit_02.prefab"
    },
    sound = {
      71010111,
      71010112,
      71010113,
      71010114,
      71010115,
      71010116,
      71010117
    },
    prepare_effect_sound = {71010110}
  },
  [42110251] = {
    id = 42110251,
    hurt_point = {
      "23:42110201:71010203"
    },
    spine_state = "skill1_1",
    effect = "10002/FX_10002_skill1_1.prefab",
    remote_effect = "100:10002/FX_10002_skill1_1_bullet.prefab",
    hit_effect = "10002/FX_10002_skill1_1_hit.prefab",
    sound = {71010201, 71010202}
  },
  [42110252] = {
    id = 42110252,
    hurt_point = {
      "23:42110201:71010206"
    },
    spine_state = "skill1_2",
    effect = "10002/FX_10002_skill1_2.prefab",
    remote_effect = "100:10002/FX_10002_skill1_1_bullet.prefab",
    hit_effect = "10002/FX_10002_skill1_1_hit.prefab",
    sound = {71010204, 71010205}
  },
  [42310251] = {
    id = 42310251,
    hurt_point = {
      "9:42310201:0"
    },
    spine_state = "skill3",
    effect = "10002/FX_10002_skill3.prefab",
    prepare_effect = "10002/FX_10002_skill3_prepare.prefab",
    effect_target = "10002/FX_10002_skill3_target.prefab",
    sound = {71010208},
    prepare_effect_sound = {71010207}
  },
  [42110351] = {
    id = 42110351,
    hurt_point = {
      "20:42110301:0"
    },
    spine_state = "skill1_1",
    effect = "10003/FX_10003_skill1_1.prefab",
    bullet_effect = "10003/FX_10003_skill1_bullet.prefab",
    bullet_hit_effect = "10003/FX_10003_skill1_hit.prefab",
    bullet_scale = 10000,
    sound = {71010301},
    bullet_sound = {71010302},
    bullet_hit_sound = {71010303}
  },
  [42110352] = {
    id = 42110352,
    hurt_point = {
      "20:42110301:0"
    },
    spine_state = "skill1_2",
    effect = "10003/FX_10003_skill1_2.prefab",
    bullet_effect = "10003/FX_10003_skill1_bullet.prefab",
    bullet_hit_effect = "10003/FX_10003_skill1_hit.prefab",
    bullet_scale = 10000,
    sound = {71010304},
    bullet_sound = {71010305},
    bullet_hit_sound = {71010306}
  },
  [42310351] = {
    id = 42310351,
    spine_state = "skill3",
    effect = "10003/FX_10003_skill3.prefab",
    prepare_effect = "10003/FX_10003_skill3_prepare.prefab",
    sound = {71010308, 71010309},
    prepare_effect_sound = {71010307}
  },
  [42110451] = {
    id = 42110451,
    hurt_point = {
      "23:42110401:0"
    },
    spine_state = "skill1",
    effect = "10004/FX_10004_skill1.prefab",
    bullet_effect = "10004/FX_10004_skill1_1_bullet.prefab",
    bullet_hit_effect = "10004/FX_10004_skill1_1_hit.prefab",
    bullet_scale = 10000,
    sound = {71010401, 71010402},
    bullet_sound = {71010403},
    bullet_hit_sound = {71010404},
    bend_scale = {1},
    buff_change_show = "102:42210451"
  },
  [42210451] = {
    id = 42210451,
    hurt_point = {
      "23:42210401:0"
    },
    spine_state = "skill2",
    effect = "10004/FX_10004_skill2.prefab",
    bullet_effect = "10004/FX_10004_skill2_bullet.prefab",
    bullet_hit_effect = "10004/FX_10004_skill2_hit.prefab",
    bullet_scale = 10000,
    sound = {71010405},
    bullet_sound = {71010406},
    bullet_hit_sound = {71010407},
    bend_scale = {1}
  },
  [42310451] = {
    id = 42310451,
    hurt_point = {
      "3:42310401:0"
    },
    spine_state = "skill3",
    effect = "10004/FX_10004_skill3.prefab",
    prepare_effect = "10004/FX_10004_skill3_prepare.prefab",
    bullet_effect = "10004/FX_10004_skill3_bullet.prefab",
    bullet_hit_effect = "10004/FX_10004_skill3_hit.prefab",
    bullet_scale = 10000,
    sound = {71010409},
    prepare_effect_sound = {71010408},
    bullet_sound = {71010410},
    bullet_hit_sound = {71010411}
  },
  [42110551] = {
    id = 42110551,
    hurt_point = {
      "20:42110501:71010502"
    },
    spine_state = "skill1_1",
    effect = "10005/FX_10005_skill1_1.prefab",
    remote_effect = "100:10005/FX_10005_skill1_bullet.prefab",
    hit_effect = "10005/FX_10005_skill1_hit.prefab",
    sound = {71010501}
  },
  [42110552] = {
    id = 42110552,
    hurt_point = {
      "20:42110501:71010504"
    },
    spine_state = "skill1_2",
    effect = "10005/FX_10005_skill1_2.prefab",
    remote_effect = "100:10005/FX_10005_skill1_bullet.prefab",
    hit_effect = "10005/FX_10005_skill1_hit.prefab",
    sound = {71010503}
  },
  [42310551] = {
    id = 42310551,
    hurt_point = {
      "29:42310501:0"
    },
    spine_state = "skill3",
    effect = "10005/FX_10005_skill3.prefab",
    prepare_effect = "10005/FX_10005_skill3_prepare.prefab",
    hit_effect = "10005/FX_10005_skill3_hit.prefab",
    sound = {71010506, 71010507},
    prepare_effect_sound = {71010505}
  },
  [42110651] = {
    id = 42110651,
    hurt_point = {
      "13:42110601:71010603",
      "19:42110602:71010603"
    },
    spine_state = "skill1_1",
    effect = "10006/FX_10006_skill1_1.prefab",
    remote_effect = "100:10006/FX_10006_skill1_1_bullet.prefab",
    hit_effect = "10006/FX_10006_skill1_1_hit.prefab",
    sound = {71010601, 71010602}
  },
  [42110652] = {
    id = 42110652,
    hurt_point = {
      "13:42110601:71010606",
      "19:42110602:71010606"
    },
    spine_state = "skill1_2",
    effect = "10006/FX_10006_skill1_2.prefab",
    remote_effect = "100:10006/FX_10006_skill1_2_bullet.prefab",
    hit_effect = "10006/FX_10006_skill1_2_hit.prefab",
    sound = {71010604, 71010605}
  },
  [42310651] = {
    id = 42310651,
    hurt_point = {
      "24:42310601:0",
      "54:42310602:0"
    },
    spine_state = "skill3",
    effect = "10006/FX_10006_skill3.prefab",
    hit_effect_list = {
      "",
      "10006/FX_10006_skill3_hit.prefab"
    },
    effect_target = "10006/FX_10006_skill3_target.prefab",
    sound = {
      71010607,
      71010608,
      71010609,
      71010610,
      71010611
    }
  },
  [42110751] = {
    id = 42110751,
    hurt_point = {
      "17:42110701:71010702"
    },
    spine_state = "skill1_1",
    effect = "10007/FX_10007_skill1_1.prefab",
    hit_effect = "10007/FX_10007_skill1_hit.prefab",
    sound = {71010701}
  },
  [42110752] = {
    id = 42110752,
    hurt_point = {
      "28:42110701:71010704"
    },
    spine_state = "skill1_2",
    effect = "10007/FX_10007_skill1_2.prefab",
    hit_effect = "10007/FX_10007_skill1_hit.prefab",
    sound = {71010703}
  },
  [42310751] = {
    id = 42310751,
    hurt_point = {
      "9:42310701:0"
    },
    spine_state = "skill3",
    effect = "10007/FX_10007_skill3.prefab",
    prepare_effect = "10007/FX_10007_skill3_prepare.prefab",
    hit_effect = "10007/FX_10007_skill3_hit.prefab",
    sound = {71010706},
    prepare_effect_sound = {71010705}
  },
  [42110753] = {
    id = 42110753,
    hurt_point = {
      "17:42110703:71110702"
    },
    spine_state = "skill1_1",
    effect = "10007_1/FX_10007_1_skill1_1.prefab",
    hit_effect = "10007_1/FX_10007_1_skill1_hit.prefab",
    sound = {71110701}
  },
  [42110754] = {
    id = 42110754,
    hurt_point = {
      "28:42110703:71110704"
    },
    spine_state = "skill1_2",
    effect = "10007_1/FX_10007_1_skill1_2.prefab",
    hit_effect = "10007_1/FX_10007_1_skill1_hit.prefab",
    sound = {71110703}
  },
  [42310753] = {
    id = 42310753,
    hurt_point = {
      "9:42310703:0"
    },
    spine_state = "skill3",
    effect = "10007_1/FX_10007_1_skill3.prefab",
    prepare_effect = "10007_1/FX_10007_1_skill3_prepare.prefab",
    hit_effect = "10007_1/FX_10007_1_skill3_hit.prefab",
    sound = {71110706},
    prepare_effect_sound = {71110705}
  },
  [42110851] = {
    id = 42110851,
    hurt_point = {
      "26:42110801:0"
    },
    spine_state = "skill1",
    effect = "10008/FX_10008_skill1.prefab",
    bullet_effect = "10008/FX_10008_skill1_bullet.prefab",
    bullet_hit_effect = "10008/FX_10008_skill1_hit.prefab",
    bullet_scale = 10000,
    sound = {71010801, 71010802},
    bullet_sound = {71010803},
    bullet_hit_sound = {71010804}
  },
  [42310851] = {
    id = 42310851,
    hurt_point = {
      "4:42310801:0"
    },
    spine_state = "skill3",
    effect = "10008/FX_10008_skill3.prefab",
    prepare_effect = "10008/FX_10008_skill3_prepare.prefab",
    bullet_effect = "10008/FX_10008_skill3_bullet.prefab",
    bullet_hit_effect = "10008/FX_10008_skill3_hit.prefab",
    bullet_scale = 10000,
    sound = {71010806},
    prepare_effect_sound = {71010805},
    bullet_hit_sound = {71010807}
  },
  [42110951] = {
    id = 42110951,
    hurt_point = {
      "20:42110901:71010903"
    },
    spine_state = "skill1_1",
    effect = "10052/FX_10052_skill1_1.prefab",
    hit_effect = "10052/FX_10052_skill1_hit.prefab",
    sound = {71010901, 71010902}
  },
  [42110952] = {
    id = 42110952,
    hurt_point = {
      "21:42110901:71010905"
    },
    spine_state = "skill1_2",
    effect = "10052/FX_10052_skill1_2.prefab",
    hit_effect = "10052/FX_10052_skill1_hit.prefab",
    sound = {71010904}
  },
  [42310951] = {
    id = 42310951,
    hurt_point = {
      "5:42310901:71010908"
    },
    spine_state = "skill3",
    effect = "10052/FX_10052_skill3.prefab",
    prepare_effect = "10052/FX_10052_skill3_prepare.prefab",
    effect_target = "10052/FX_10052_skill3_target.prefab",
    sound = {71010907},
    prepare_effect_sound = {71010906}
  },
  [42111051] = {
    id = 42111051,
    hurt_point = {
      "12:42111001:71011002",
      "22:42111002:71011002"
    },
    spine_state = "skill1_1",
    effect = "10010/FX_10010_skill1_1.prefab",
    remote_effect = "100:10010/FX_10010_skill1_1_bullet.prefab",
    hit_effect_list = {
      "10010/FX_10010_skill1_1_hit.prefab",
      "10010/FX_10010_skill1_1_hit_02.prefab"
    },
    sound = {71011001, 71011003}
  },
  [42111052] = {
    id = 42111052,
    hurt_point = {
      "12:42111001:71011005",
      "22:42111002:71011005"
    },
    spine_state = "skill1_2",
    effect = "10010/FX_10010_skill1_2.prefab",
    remote_effect = "100:10010/FX_10010_skill1_1_bullet.prefab",
    hit_effect_list = {
      "10010/FX_10010_skill1_2_hit.prefab",
      "10010/FX_10010_skill1_2_hit_02.prefab"
    },
    sound = {71011004, 71011006}
  },
  [42311051] = {
    id = 42311051,
    hurt_point = {
      "19:42311001:71011009"
    },
    spine_state = "skill3",
    effect = "10010/FX_10010_skill3.prefab",
    prepare_effect = "10010/FX_10010_skill3_prepare.prefab",
    hit_effect = "10010/FX_10010_skill3_hit.prefab",
    sound = {71011008},
    prepare_effect_sound = {71011007}
  },
  [42111151] = {
    id = 42111151,
    hurt_point = {
      "11:42111101:71011103",
      "24:42111102:71011103"
    },
    spine_state = "skill1",
    effect = "10011/FX_10011_skill1.prefab",
    remote_effect = "100:10011/FX_10011_skill1_bullet.prefab",
    hit_effect_list = {
      "10011/FX_10011_skill1_hit.prefab",
      "10011/FX_10011_skill1_hit_02.prefab"
    },
    sound = {71011101, 71011102}
  },
  [42311151] = {
    id = 42311151,
    hurt_point = {
      "9:42311101:71011107",
      "24:42311102:71011107"
    },
    spine_state = "skill3",
    effect = "10011/FX_10011_skill3.prefab",
    prepare_effect = "10011/FX_10011_skill3_prepare.prefab",
    remote_effect = "100:10011/FX_10011_skill3_bullet.prefab",
    hit_effect_list = {
      "10011/FX_10011_skill3_hit.prefab",
      "10011/FX_10011_skill3_hit_02.prefab"
    },
    sound = {71011105, 71011106},
    prepare_effect_sound = {71011104}
  },
  [42111251] = {
    id = 42111251,
    hurt_point = {
      "6:42111201:71011203",
      "16:42111202:71011203"
    },
    spine_state = "skill1_1",
    effect = "10044/FX_10044_skill1_1.prefab",
    remote_effect = "100:10044/FX_10044_skill1_bullet.prefab",
    hit_effect = "10044/FX_10044_skill1_hit.prefab",
    sound = {71011201, 71011202}
  },
  [42111252] = {
    id = 42111252,
    hurt_point = {
      "6:42111201:71011206",
      "16:42111202:71011206"
    },
    spine_state = "skill1_2",
    effect = "10044/FX_10044_skill1_2.prefab",
    remote_effect = "100:10044/FX_10044_skill1_bullet.prefab",
    hit_effect = "10044/FX_10044_skill1_hit.prefab",
    sound = {71011204, 71011205}
  },
  [42211251] = {
    id = 42211251,
    spine_state = "skill2",
    effect = "10044/FX_10044_skill2.prefab",
    hit_effect = "10044/FX_10044_skill1_hit.prefab",
    sound = {71011207}
  },
  [42311251] = {
    id = 42311251,
    hurt_point = {
      "16:42311201:71011210",
      "19:42311202:71011210",
      "22:42311203:71011210",
      "25:42311204:71011210",
      "28:42311205:71011210"
    },
    spine_state = "skill3",
    effect = "10044/FX_10044_skill3.prefab",
    hit_effect = "10044/FX_10044_skill1_hit.prefab",
    sound = {71011208, 71011209}
  },
  [42111351] = {
    id = 42111351,
    hurt_point = {
      "17:42111301:0"
    },
    spine_state = "skill1_1",
    effect = "10013/FX_10013_skill1_1.prefab",
    bullet_effect = "10013/FX_10013_skill1_1_bullet.prefab",
    bullet_hit_effect = "10013/FX_10013_skill1_1_hit.prefab",
    bullet_scale = 10000,
    sound = {71011301},
    bullet_sound = {71011302},
    bullet_hit_sound = {71011303}
  },
  [42111352] = {
    id = 42111352,
    hurt_point = {
      "18:42111301:0"
    },
    spine_state = "skill1_2",
    effect = "10013/FX_10013_skill1_2.prefab",
    bullet_effect = "10013/FX_10013_skill1_2_bullet.prefab",
    bullet_hit_effect = "10013/FX_10013_skill1_2_hit.prefab",
    bullet_scale = 10000,
    sound = {71011304},
    bullet_sound = {71011305},
    bullet_hit_sound = {71011306}
  },
  [42311351] = {
    id = 42311351,
    hurt_point = {
      "14:42311301:0"
    },
    spine_state = "skill3",
    effect = "10013/FX_10013_skill3.prefab",
    prepare_effect = "10013/FX_10013_skill3_prepare.prefab",
    effect_target = "10013/FX_10013_skill3_target.prefab",
    sound = {71011308},
    prepare_effect_sound = {71011307}
  },
  [42111451] = {
    id = 42111451,
    hurt_point = {
      "17:42111401:0"
    },
    spine_state = "skill1_1",
    effect = "10046/FX_10046_skill1_1.prefab",
    bullet_effect = "10046/FX_10046_skill1_bullet.prefab",
    bullet_hit_effect = "10046/FX_10046_skill1_hit.prefab",
    bullet_scale = 10000,
    sound = {71011401},
    bullet_sound = {71011402},
    bullet_hit_sound = {71011403}
  },
  [42111452] = {
    id = 42111452,
    hurt_point = {
      "17:42111401:0"
    },
    spine_state = "skill1_2",
    effect = "10046/FX_10046_skill1_2.prefab",
    bullet_effect = "10046/FX_10046_skill1_bullet.prefab",
    bullet_hit_effect = "10046/FX_10046_skill1_hit.prefab",
    bullet_scale = 10000,
    sound = {71011404},
    bullet_sound = {71011405},
    bullet_hit_sound = {71011406}
  },
  [42311451] = {
    id = 42311451,
    hurt_point = {
      "13:42311401:0",
      "24:42311402:0"
    },
    spine_state = "skill3",
    effect = "10046/FX_10046_skill3.prefab",
    prepare_effect = "10046/FX_10046_skill3_prepare.prefab",
    bullet_effect = "10046/FX_10046_skill3_bullet.prefab",
    bullet_hit_effect_list = {
      "10046/FX_10046_skill3_hit.prefab",
      "10046/FX_10046_skill3_hit02.prefab"
    },
    bullet_scale = 10000,
    sound = {71011408, 71011411},
    prepare_effect_sound = {71011407},
    bullet_sound = {71011409},
    bullet_hit_sound = {71011410},
    bend_scale = {0, 0}
  },
  [42111551] = {
    id = 42111551,
    hurt_point = {
      "21:42111501:71011502"
    },
    spine_state = "skill1_1",
    effect = "10015/FX_10015_skill1_1.prefab",
    remote_effect = "100:10015/FX_10015_skill1_bullet.prefab",
    hit_effect = "10015/FX_10015_skill1_1_hit.prefab",
    sound = {71011501}
  },
  [42111552] = {
    id = 42111552,
    hurt_point = {
      "21:42111501:71011504"
    },
    spine_state = "skill1_2",
    effect = "10015/FX_10015_skill1_2.prefab",
    remote_effect = "100:10015/FX_10015_skill1_bullet.prefab",
    hit_effect = "10015/FX_10015_skill1_2_hit.prefab",
    sound = {71011503}
  },
  [42311551] = {
    id = 42311551,
    hurt_point = {
      "26:42311501:71011510"
    },
    spine_state = "skill3",
    effect = "10015/FX_10015_skill3.prefab",
    prepare_effect = "10015/FX_10015_skill3_prepare.prefab",
    effect_target = "10015/FX_10015_skill3_target.prefab",
    sound = {
      71011506,
      71011507,
      71011508,
      71011509
    },
    prepare_effect_sound = {71011505}
  },
  [42111651] = {
    id = 42111651,
    hurt_point = {
      "27:42111601:71011603"
    },
    spine_state = "skill1_1",
    effect = "10016/FX_10016_skill1_1.prefab",
    hit_effect = "10016/FX_10016_skill1_1_hit.prefab",
    sound = {71011601, 71011602}
  },
  [42111652] = {
    id = 42111652,
    hurt_point = {
      "27:42111601:71011605"
    },
    spine_state = "skill1_2",
    effect = "10016/FX_10016_skill1_2.prefab",
    effect_target = "10016/FX_10016_skill1_2_target.prefab",
    sound = {71011604, 71011606}
  },
  [42211651] = {
    id = 42211651,
    hurt_point = {
      "24:42211601:0"
    },
    spine_state = "skill2",
    effect = "10016/FX_10016_skill2.prefab"
  },
  [42311651] = {
    id = 42311651,
    hurt_point = {
      "48:42311601:0"
    },
    spine_state = "skill3",
    effect = "10016/FX_10016_skill3.prefab",
    prepare_effect = "10016/FX_10016_skill3_prepare.prefab",
    sound = {71011610, 71011612},
    prepare_effect_sound = {71011609}
  },
  [42111653] = {
    id = 42111653,
    hurt_point = {
      "27:42111603:71111603"
    },
    spine_state = "skill1_1",
    effect = "10016_1/FX_10016_1_skill1_1.prefab",
    hit_effect = "10016_1/FX_10016_1_skill1_1_hit.prefab",
    sound = {71111601, 71111602}
  },
  [42111654] = {
    id = 42111654,
    hurt_point = {
      "27:42111603:71111603"
    },
    spine_state = "skill1_2",
    effect = "10016_1/FX_10016_1_skill1_2.prefab",
    effect_target = "10016_1/FX_10016_1_skill1_2_target.prefab",
    sound = {71111604, 71111605}
  },
  [42211653] = {
    id = 42211653,
    hurt_point = {
      "24:42211603:0"
    },
    spine_state = "skill2",
    effect = "10016_1/FX_10016_1_skill2.prefab"
  },
  [42311653] = {
    id = 42311653,
    hurt_point = {
      "48:42311603:71011609"
    },
    spine_state = "skill3",
    effect = "10016_1/FX_10016_1_skill3.prefab",
    prepare_effect = "10016_1/FX_10016_1_skill3_prepare.prefab",
    sound = {71111608, 71111609},
    prepare_effect_sound = {71111607}
  },
  [42111751] = {
    id = 42111751,
    hurt_point = {
      "23:42111701:0"
    },
    spine_state = "skill1_1",
    effect = "10017/FX_10017_skill1_1.prefab",
    bullet_effect = "10017/FX_10017_skill1_1_bullet.prefab",
    bullet_hit_effect = "10017/FX_10017_skill1_1_hit.prefab",
    bullet_scale = 10000,
    sound = {71011701, 71011702},
    bullet_sound = {71011703},
    bullet_hit_sound = {71011704},
    buff_change_show = "523:42211751"
  },
  [42111752] = {
    id = 42111752,
    hurt_point = {
      "23:42111701:0"
    },
    spine_state = "skill1_2",
    effect = "10017/FX_10017_skill1_2.prefab",
    bullet_effect = "10017/FX_10017_skill1_2_bullet.prefab",
    bullet_hit_effect = "10017/FX_10017_skill1_2_hit.prefab",
    bullet_scale = 10000,
    sound = {71011705, 71011706},
    bullet_sound = {71011707},
    bullet_hit_sound = {71011708},
    buff_change_show = "523:42211751"
  },
  [42211751] = {
    id = 42211751,
    hurt_point = {
      "11:42111702:0",
      "14:42111703:0",
      "18:42111704:0",
      "23:42111705:0",
      "26:42111706:0"
    },
    spine_state = "skill1_3",
    effect = "10017/FX_10017_skill1_3.prefab",
    bullet_effect = "10017/FX_10017_skill1_3_bullet.prefab",
    bullet_hit_effect = "10017/FX_10017_skill1_3_hit.prefab",
    bullet_scale = 10000,
    sound = {
      71011709,
      71011710,
      71011711,
      71011712
    },
    bullet_sound = {71011713},
    bullet_hit_sound = {71011714},
    bend_scale = {
      0,
      0,
      0,
      0,
      0
    },
    start_points = {
      "1",
      "2",
      "3",
      "4",
      "5"
    }
  },
  [42311751] = {
    id = 42311751,
    spine_state = "skill3",
    prepare_effect = "10017/FX_10017_skill3_prepare.prefab",
    sound = {71011716},
    prepare_effect_sound = {71011715}
  },
  [42111851] = {
    id = 42111851,
    hurt_point = {
      "28:42111801:0"
    },
    spine_state = "skill1_1",
    effect = "10018/FX_10018_skill1_1.prefab",
    bullet_effect = "10018/FX_10018_skill1_bullet.prefab",
    bullet_hit_effect = "10018/FX_10018_skill1_bullet_hit.prefab",
    bullet_scale = 10000,
    sound = {71011801},
    bullet_sound = {71011802},
    bullet_hit_sound = {71011803}
  },
  [42111852] = {
    id = 42111852,
    hurt_point = {
      "28:42111801:0"
    },
    spine_state = "skill1_2",
    effect = "10018/FX_10018_skill1_2.prefab",
    bullet_effect = "10018/FX_10018_skill1_bullet.prefab",
    bullet_hit_effect = "10018/FX_10018_skill1_bullet_hit.prefab",
    bullet_scale = 10000,
    sound = {71011804},
    bullet_sound = {71011805},
    bullet_hit_sound = {71011806}
  },
  [42311851] = {
    id = 42311851,
    hurt_point = {
      "20:42311801:0"
    },
    spine_state = "skill3",
    effect = "10018/FX_10018_skill3.prefab",
    prepare_effect = "10018/FX_10018_skill3_prepare.prefab",
    sound = {71011809, 71011810},
    prepare_effect_sound = {71011808}
  },
  [42111853] = {
    id = 42111853,
    hurt_point = {
      "28:42111803:0"
    },
    spine_state = "skill1_1",
    effect = "10018_1/FX_10018_1_skill1_1.prefab",
    bullet_effect = "10018_1/FX_10018_1_skill1_bullet.prefab",
    bullet_hit_effect = "10018_1/FX_10018_1_skill1_hit.prefab",
    bullet_scale = 10000,
    sound = {71111801},
    bullet_sound = {71111802},
    bullet_hit_sound = {71111803}
  },
  [42111854] = {
    id = 42111854,
    hurt_point = {
      "28:42111803:0"
    },
    spine_state = "skill1_2",
    effect = "10018_1/FX_10018_1_skill1_2.prefab",
    bullet_effect = "10018_1/FX_10018_1_skill1_bullet.prefab",
    bullet_hit_effect = "10018_1/FX_10018_1_skill1_hit.prefab",
    bullet_scale = 10000,
    sound = {71111804},
    bullet_sound = {71111805},
    bullet_hit_sound = {71111806}
  },
  [42311853] = {
    id = 42311853,
    hurt_point = {
      "20:42311803:0"
    },
    spine_state = "skill3",
    effect = "10018_1/FX_10018_1_skill3.prefab",
    prepare_effect = "10018_1/FX_10018_1_skill3_prepare.prefab",
    sound = {71111808, 71111809},
    prepare_effect_sound = {71111807}
  },
  [42111951] = {
    id = 42111951,
    hurt_point = {
      "17:42111901:71011904"
    },
    spine_state = "skill1_1",
    effect = "10019/FX_10019_skill1_1.prefab",
    remote_effect = "100:10019/FX_10019_skill1_1_bullet.prefab",
    hit_effect = "10019/FX_10019_skill1_1_hit.prefab",
    sound = {71011903}
  },
  [42111952] = {
    id = 42111952,
    hurt_point = {
      "17:42111901:71011902"
    },
    spine_state = "skill1_2",
    effect = "10019/FX_10019_skill1_2.prefab",
    remote_effect = "100:10019/FX_10019_skill1_2_bullet.prefab",
    hit_effect = "10019/FX_10019_skill1_2_hit.prefab",
    sound = {71011901}
  },
  [42311951] = {
    id = 42311951,
    hurt_point = {
      "14:42311901:71011907"
    },
    spine_state = "skill3",
    effect = "10019/FX_10019_skill3.prefab",
    prepare_effect = "10019/FX_10019_skill3_prepare.prefab",
    hit_effect = "10019/FX_10019_skill3_hit.prefab",
    sound = {71011906},
    prepare_effect_sound = {71011905}
  },
  [42112051] = {
    id = 42112051,
    hurt_point = {
      "12:42112001:71012003",
      "23:42112002:71012003"
    },
    spine_state = "skill1_1",
    effect = "10020/FX_10020_skill1_1.prefab",
    remote_effect = "100:10020/FX_10020_skill1_bullet.prefab",
    hit_effect = "10020/FX_10020_skill1_hit.prefab",
    sound = {71012001, 71012002}
  },
  [42112052] = {
    id = 42112052,
    hurt_point = {
      "12:42112001:71012006",
      "23:42112002:71012006"
    },
    spine_state = "skill1_2",
    effect = "10020/FX_10020_skill1_2.prefab",
    remote_effect = "100:10020/FX_10020_skill1_2_bullet.prefab",
    hit_effect = "10020/FX_10020_skill1_hit.prefab",
    sound = {71012004, 71012005}
  },
  [42312051] = {
    id = 42312051,
    hurt_point = {
      "13:42312001:71012009",
      "18:42312002:71012009",
      "23:42312003:71012009"
    },
    spine_state = "skill3",
    effect = "10020/FX_10020_skill3.prefab",
    prepare_effect = "10020/FX_10020_skill3_prepare.prefab",
    hit_effect = "10020/FX_10020_skill3_hit.prefab",
    effect_target = "10020/FX_10020_skill3_target.prefab",
    sound = {71012008},
    prepare_effect_sound = {71012007}
  },
  [42112053] = {
    id = 42112053,
    hurt_point = {
      "10:42112003:71112003",
      "24:42112004:71112003"
    },
    spine_state = "skill1_1",
    effect = "10020_1/FX_10020_1_skill1_1.prefab",
    remote_effect = "100:10020_1/FX_10020_1_skill1_bullet.prefab",
    hit_effect = "10020_1/FX_10020_1_skill1_hit.prefab",
    sound = {71112001, 71112002}
  },
  [42112054] = {
    id = 42112054,
    hurt_point = {
      "11:42112003:71112006",
      "24:42112004:71112006"
    },
    spine_state = "skill1_2",
    effect = "10020_1/FX_10020_1_skill1_2.prefab",
    remote_effect = "100:10020_1/FX_10020_1_skill1_2_bullet.prefab",
    hit_effect = "10020_1/FX_10020_1_skill1_hit.prefab",
    sound = {71112004, 71112005}
  },
  [42312053] = {
    id = 42312053,
    hurt_point = {
      "13:42312004:71112009",
      "18:42312005:71112009",
      "23:42312006:71112009"
    },
    spine_state = "skill3",
    effect = "10020_1/FX_10020_1_skill3.prefab",
    prepare_effect = "10020_1/FX_10020_1_skill3_prepare.prefab",
    hit_effect = "10020_1/FX_10020_1_skill3_hit.prefab",
    effect_target = "10020_1/FX_10020_1_skill3_target.prefab",
    sound = {71112008},
    prepare_effect_sound = {71112007}
  },
  [42112151] = {
    id = 42112151,
    hurt_point = {
      "19:42112101:71012106"
    },
    spine_state = "skill1",
    effect = "10021/FX_10021_skill1.prefab",
    remote_effect = "100:10021/FX_10021_skill1_bullet.prefab",
    hit_effect = "10021/FX_10021_skill1_hit.prefab",
    sound = {71012105}
  },
  [42312151] = {
    id = 42312151,
    hurt_point = {
      "4:42312101:71012104"
    },
    spine_state = "skill3",
    effect = "10021/FX_10021_skill3.prefab",
    prepare_effect = "10021/FX_10021_skill3_prepare.prefab",
    hit_effect = "10021/FX_10021_skill3_hit.prefab",
    sound = {71012102, 71012103},
    prepare_effect_sound = {71012101}
  },
  [42112251] = {
    id = 42112251,
    hurt_point = {
      "16:42112201:71012202"
    },
    spine_state = "skill1_1",
    effect = "10022/FX_10022_skill1_1.prefab",
    remote_effect = "100:10022/FX_10022_skill1_bullet.prefab",
    hit_effect = "10022/FX_10022_skill1_hit.prefab",
    sound = {71012201}
  },
  [42112252] = {
    id = 42112252,
    hurt_point = {
      "16:42112201:71012204"
    },
    spine_state = "skill1_2",
    effect = "10022/FX_10022_skill1_2.prefab",
    remote_effect = "100:10022/FX_10022_skill1_bullet.prefab",
    hit_effect = "10022/FX_10022_skill1_hit.prefab",
    sound = {71012203}
  },
  [42212251] = {
    id = 42212251,
    spine_state = "skill2",
    effect = "10022/FX_10022_skill2.prefab",
    sound = {71012205}
  },
  [42312251] = {
    id = 42312251,
    hurt_point = {
      "4:42312201:71012209",
      "17:42312202:71012210"
    },
    spine_state = "skill3",
    effect = "10022/FX_10022_skill3.prefab",
    prepare_effect = "10022/FX_10022_skill3_prepare.prefab",
    hit_effect = "10022/FX_10022_skill3_hit.prefab",
    sound = {71012207, 71012208},
    prepare_effect_sound = {71012206}
  },
  [42112351] = {
    id = 42112351,
    hurt_point = {
      "13:42112301:71012303",
      "18:42112302:71012303"
    },
    spine_state = "skill1_1",
    effect = "10023/FX_10023_skill1_1.prefab",
    remote_effect = "100:10023/FX_10023_skill1_1_bullet.prefab",
    hit_effect = "10023/FX_10023_skill1_1_hit.prefab",
    sound = {71012301, 71012302}
  },
  [42112352] = {
    id = 42112352,
    hurt_point = {
      "12:42112301:71012309",
      "17:42112302:71012309"
    },
    spine_state = "skill1_2",
    effect = "10023/FX_10023_skill1_2.prefab",
    remote_effect = "100:10023/FX_10023_skill1_2_bullet.prefab",
    hit_effect = "10023/FX_10023_skill1_2_hit.prefab",
    sound = {71012307, 71012308}
  },
  [42312351] = {
    id = 42312351,
    hurt_point = {
      "33:42312301:0"
    },
    spine_state = "skill3",
    effect = "10023/FX_10023_skill3.prefab",
    hit_effect = "10023/FX_10023_skill1_1_hit.prefab",
    effect_target = "10023/FX_10023_skill3_target.prefab",
    sound = {
      71012304,
      71012305,
      71012306
    }
  },
  [42112451] = {
    id = 42112451,
    hurt_point = {
      "26:42112401:0"
    },
    spine_state = "skill1_1",
    effect = "10024/FX_10024_skill1_1.prefab",
    bullet_effect = "10024/FX_10024_skill1_1_bullet.prefab",
    bullet_hit_effect = "10024/FX_10024_skill1_1_hit.prefab",
    bullet_scale = 10000,
    sound = {71012401, 71012402},
    bullet_sound = {71012403},
    bullet_hit_sound = {71012404},
    bend_scale = {1}
  },
  [42112452] = {
    id = 42112452,
    hurt_point = {
      "26:42112401:0"
    },
    spine_state = "skill1_2",
    effect = "10024/FX_10024_skill1_2.prefab",
    bullet_effect = "10024/FX_10024_skill1_1_bullet.prefab",
    bullet_hit_effect = "10024/FX_10024_skill1_1_hit.prefab",
    bullet_scale = 10000,
    sound = {71012405, 71012406},
    bullet_sound = {71012407},
    bullet_hit_sound = {71012408},
    bend_scale = {1}
  },
  [42312451] = {
    id = 42312451,
    hurt_point = {
      "33:42312401:0"
    },
    spine_state = "skill3",
    effect = "10024/FX_10024_skill3.prefab",
    prepare_effect = "10024/FX_10024_skill3_prepare.prefab",
    effect_target = "10024/FX_10024_skill3_target.prefab",
    sound_target = {71012412},
    sound = {71012410, 71012411},
    prepare_effect_sound = {71012409},
    effect_target_limit = 1
  },
  [42112551] = {
    id = 42112551,
    hurt_point = {
      "17:42112501:71012502",
      "22:42112502:71012502"
    },
    spine_state = "skill1_1",
    effect = "10025/FX_10025_skill1_1.prefab",
    remote_effect = "100:10025/FX_10025_skill1_1_bullet.prefab",
    hit_effect = "10025/FX_10025_skill1_1_hit.prefab",
    sound = {71012501, 71012503}
  },
  [42112552] = {
    id = 42112552,
    hurt_point = {
      "17:42112501:71012505",
      "22:42112502:71012505"
    },
    spine_state = "skill1_2",
    effect = "10025/FX_10025_skill1_2.prefab",
    remote_effect = "100:10025/FX_10025_skill1_2_bullet.prefab",
    hit_effect_list = {
      "10025/FX_10025_skill1_2_hit.prefab",
      "10025/FX_10025_skill1_2_hit_02.prefab"
    },
    sound = {71012504, 71012506}
  },
  [42312551] = {
    id = 42312551,
    hurt_point = {
      "22:42312501:71012509"
    },
    spine_state = "skill3",
    effect = "10025/FX_10025_skill3.prefab",
    prepare_effect = "10025/FX_10025_skill3_prepare.prefab",
    hit_effect = "10025/FX_10025_skill3_hit.prefab",
    sound = {71012508, 71012510},
    prepare_effect_sound = {71012507}
  },
  [42112651] = {
    id = 42112651,
    hurt_point = {
      "10:42112601:71012603",
      "19:42112602:71012603"
    },
    spine_state = "skill1_1",
    effect = "10026/FX_10026_skill1_1.prefab",
    remote_effect = "100:10026/FX_10026_skill1_1_bullet.prefab",
    hit_effect = "10026/FX_10026_skill1_1_hit.prefab",
    sound = {71012601, 71012602}
  },
  [42112652] = {
    id = 42112652,
    hurt_point = {
      "11:42112601:71012606",
      "18:42112602:71012606"
    },
    spine_state = "skill1_2",
    effect = "10026/FX_10026_skill1_2.prefab",
    remote_effect = "100:10026/FX_10026_skill1_2_bullet.prefab",
    hit_effect = "10026/FX_10026_skill1_2_hit.prefab",
    sound = {
      71012604,
      71012605,
      71012607,
      71012608
    }
  },
  [42212651] = {
    id = 42212651,
    hurt_point = {
      "22:42212601:71012611"
    },
    spine_state = "skill2",
    effect = "10026/FX_10026_skill2.prefab",
    effect_target = "10026/FX_10026_skill2_target.prefab",
    sound = {71012609, 71012610}
  },
  [42312651] = {
    id = 42312651,
    spine_state = "skill3",
    prepare_effect = "10026/FX_10026_skill3_prepare.prefab",
    sound = {71012613},
    prepare_effect_sound = {71012612}
  },
  [42112751] = {
    id = 42112751,
    hurt_point = {
      "14:42112701:71012703",
      "30:42112702:71012703"
    },
    spine_state = "skill1_1",
    effect = "10027/FX_10027_skill1_1.prefab",
    remote_effect = "100:10027/FX_10027_skill1_1_bullet.prefab",
    hit_effect = "10027/FX_10027_skill1_hit.prefab",
    sound = {71012701, 71012702},
    buff_change_show = "523:42212751"
  },
  [42112752] = {
    id = 42112752,
    hurt_point = {
      "14:42112701:71012706",
      "30:42112702:71012706"
    },
    spine_state = "skill1_2",
    effect = "10027/FX_10027_skill1_2.prefab",
    remote_effect = "100:10027/FX_10027_skill1_1_bullet.prefab",
    hit_effect = "10027/FX_10027_skill1_hit.prefab",
    sound = {71012704, 71012705},
    buff_change_show = "523:42212752"
  },
  [42212751] = {
    id = 42212751,
    hurt_point = {
      "16:42212701:71012709",
      "19:42212702:71012709",
      "29:42212703:71012712",
      "31:42212704:71012712"
    },
    spine_state = "skill1_3",
    effect = "10027/FX_10027_skill1_3.prefab",
    remote_effect = "100:10027/FX_10027_skill1_1_bullet.prefab",
    hit_effect = "10027/FX_10027_skill1_3_hit.prefab",
    sound = {71012707, 71012708}
  },
  [42212752] = {
    id = 42212752,
    hurt_point = {
      "11:42212701:71012709",
      "17:42212702:71012709",
      "32:42212703:71012712",
      "34:42212704:71012712"
    },
    spine_state = "skill1_4",
    effect = "10027/FX_10027_skill1_4.prefab",
    remote_effect = "100:10027/FX_10027_skill1_1_bullet.prefab",
    hit_effect = "10027/FX_10027_skill1_3_hit.prefab",
    sound = {71012710, 71012711}
  },
  [42312751] = {
    id = 42312751,
    spine_state = "skill3",
    effect = "10027/FX_10027_skill3.prefab",
    prepare_effect = "10027/FX_10027_skill3_prepare.prefab",
    sound = {71012714},
    prepare_effect_sound = {71012713}
  },
  [42112753] = {
    id = 42112753,
    hurt_point = {
      "14:42112703:71112703",
      "30:42112704:71112703"
    },
    spine_state = "skill1_1",
    effect = "10027_1/FX_10027_1_skill1_1.prefab",
    remote_effect = "100:10027_1/FX_10027_1_skill1_1_bullet.prefab",
    hit_effect = "10027_1/FX_10027_1_skill1_hit.prefab",
    sound = {71112701, 71112702},
    buff_change_show = "523:42212753"
  },
  [42112754] = {
    id = 42112754,
    hurt_point = {
      "14:42112703:71112706",
      "30:42112704:71112706"
    },
    spine_state = "skill1_2",
    effect = "10027_1/FX_10027_1_skill1_2.prefab",
    remote_effect = "100:10027_1/FX_10027_1_skill1_1_bullet.prefab",
    hit_effect = "10027_1/FX_10027_1_skill1_hit.prefab",
    sound = {71112704, 71112705},
    buff_change_show = "523:42212754"
  },
  [42212753] = {
    id = 42212753,
    hurt_point = {
      "16:42212705:71112709",
      "19:42212706:71112709",
      "29:42212707:71112709",
      "31:42212708:71112709"
    },
    spine_state = "skill1_3",
    effect = "10027_1/FX_10027_1_skill1_3.prefab",
    remote_effect = "100:10027_1/FX_10027_1_skill1_1_bullet.prefab",
    hit_effect = "10027_1/FX_10027_1_skill1_3_hit.prefab",
    sound = {71112707, 71112708}
  },
  [42212754] = {
    id = 42212754,
    hurt_point = {
      "11:42212705:71112712",
      "17:42212706:71112712",
      "32:42212707:71112712",
      "34:42212708:71112712"
    },
    spine_state = "skill1_4",
    effect = "10027_1/FX_10027_1_skill1_4.prefab",
    remote_effect = "100:10027_1/FX_10027_1_skill1_1_bullet.prefab",
    hit_effect = "10027_1/FX_10027_1_skill1_3_hit.prefab",
    sound = {71112710, 71112711}
  },
  [42312753] = {
    id = 42312753,
    spine_state = "skill3",
    effect = "10027_1/FX_10027_1_skill3.prefab",
    prepare_effect = "10027_1/FX_10027_1_skill3_prepare.prefab",
    sound = {71112714},
    prepare_effect_sound = {71112713}
  },
  [42112851] = {
    id = 42112851,
    hurt_point = {
      "16:42112801:71012802"
    },
    spine_state = "skill1_1",
    effect = "10028/FX_10028_skill1_1.prefab",
    remote_effect = "100:10028/FX_10028_skill1_1_bullet.prefab",
    hit_effect = "10028/FX_10028_skill1_1_hit.prefab",
    sound = {71012801}
  },
  [42112852] = {
    id = 42112852,
    hurt_point = {
      "16:42112801:71012804"
    },
    spine_state = "skill1_2",
    effect = "10028/FX_10028_skill1_2.prefab",
    remote_effect = "100:10028/FX_10028_skill1_1_bullet.prefab",
    hit_effect = "10028/FX_10028_skill1_1_hit.prefab",
    sound = {71012803}
  },
  [42312851] = {
    id = 42312851,
    hurt_point = {
      "40:42312801:0"
    },
    spine_state = "skill3",
    effect = "10028/FX_10028_skill3.prefab",
    hit_effect = "10028/FX_10028_skill1_1_hit.prefab",
    sound = {
      71012805,
      71012806,
      71012807
    }
  },
  [42112951] = {
    id = 42112951,
    hurt_point = {
      "30:42112901:71012903"
    },
    spine_state = "skill1_1",
    effect = "10029/FX_10029_skill1_1.prefab",
    hit_effect = "10029/FX_10029_skill1_1_hit.prefab",
    sound = {71012901, 71012902}
  },
  [42112952] = {
    id = 42112952,
    hurt_point = {
      "30:42112901:71012906"
    },
    spine_state = "skill1_2",
    effect = "10029/FX_10029_skill1_2.prefab",
    effect_target = "10029/FX_10029_skill1_2_target.prefab",
    sound_target = {71012905},
    sound = {71012904}
  },
  [42312951] = {
    id = 42312951,
    hurt_point = {
      "30:42312901:0",
      "46:42312902:0"
    },
    spine_state = "skill3",
    effect = "10029/FX_10029_skill3.prefab",
    prepare_effect = "10029/FX_10029_skill3_prepare.prefab",
    effect_target = "10029/FX_10029_skill3_target.prefab",
    sound_target = {71012909},
    sound = {71012908},
    prepare_effect_sound = {71012907}
  },
  [42113051] = {
    id = 42113051,
    hurt_point = {
      "16:42113001:0"
    },
    spine_state = "skill1_1",
    effect = "10030/FX_10030_skill1_1.prefab",
    bullet_effect = "10030/FX_10030_skill1_1_bullet.prefab",
    bullet_hit_effect = "10030/FX_10030_skill1_1_hit.prefab",
    bullet_scale = 10000,
    sound = {71013001, 71013002},
    bullet_sound = {71013003},
    bullet_hit_sound = {71013004}
  },
  [42113052] = {
    id = 42113052,
    hurt_point = {
      "16:42113001:0"
    },
    spine_state = "skill1_2",
    effect = "10030/FX_10030_skill1_2.prefab",
    bullet_effect = "10030/FX_10030_skill1_2_bullet.prefab",
    bullet_hit_effect = "10030/FX_10030_skill1_1_hit.prefab",
    bullet_scale = 10000,
    sound = {71013005, 71013006},
    bullet_sound = {71013007},
    bullet_hit_sound = {71013008}
  },
  [42313051] = {
    id = 42313051,
    hurt_point = {
      "17:42313001:0"
    },
    spine_state = "skill3",
    effect = "10030/FX_10030_skill3.prefab",
    prepare_effect = "10030/FX_10030_skill3_prepare.prefab",
    sound = {71013010, 71013011},
    prepare_effect_sound = {71013009}
  },
  [42113151] = {
    id = 42113151,
    hurt_point = {
      "10:42113101:71013101",
      "26:42113102:71013102"
    },
    spine_state = "skill1_1",
    effect = "10031/FX_10031_skill1_1.prefab",
    remote_effect = "100:10031/FX_10031_skill1_1_bullet.prefab",
    hit_effect_list = {
      "10031/FX_10031_skill1_1_hit.prefab",
      "10031/FX_10031_skill1_1_hit02.prefab"
    },
    sound = {71013103, 71013104}
  },
  [42113152] = {
    id = 42113152,
    hurt_point = {
      "10:42113101:71013105",
      "25:42113102:71013105"
    },
    spine_state = "skill1_2",
    effect = "10031/FX_10031_skill1_2.prefab",
    remote_effect = "100:10031/FX_10031_skill1_1_bullet.prefab",
    hit_effect = "10031/FX_10031_skill1_2_hit01.prefab",
    effect_target = "10031/FX_10031_skill1_2_target.prefab",
    sound_target = {71013108},
    sound = {71013106, 71013107}
  },
  [42313151] = {
    id = 42313151,
    hurt_point = {
      "1:42313101:0"
    },
    spine_state = "skill3",
    effect = "10031/FX_10031_skill3.prefab",
    prepare_effect = "10031/FX_10031_skill3_prepare.prefab",
    sound = {71013111},
    prepare_effect_sound = {71013110}
  },
  [42113251] = {
    id = 42113251,
    hurt_point = {
      "13:42113201:71013203",
      "23:42113202:71013203"
    },
    spine_state = "skill1_1",
    effect = "10032/FX_10032_skill1.prefab",
    remote_effect = "100:10032/FX_10032_skill1_1_bullet.prefab",
    hit_effect = "10032/FX_10032_skill1_hit.prefab",
    sound = {71013201, 71013202}
  },
  [42113252] = {
    id = 42113252,
    hurt_point = {
      "13:42113201:71013206",
      "23:42113202:71013206"
    },
    spine_state = "skill1_2",
    effect = "10032/FX_10032_skill1_2.prefab",
    remote_effect = "100:10032/FX_10032_skill1_2_bullet.prefab",
    hit_effect = "10032/FX_10032_skill1_hit.prefab",
    sound = {71013204, 71013205}
  },
  [42213251] = {
    id = 42213251,
    hurt_point = {
      "30:42213201:71013210"
    },
    spine_state = "skill2",
    effect = "10032/FX_10032_skill2.prefab",
    sound = {
      71013207,
      71013208,
      71013209
    }
  },
  [42313251] = {
    id = 42313251,
    hurt_point = {
      "6:42313201:71013216",
      "21:42313202:71013216",
      "31:42313203:71013216",
      "46:42313204:71013216"
    },
    spine_state = "skill3",
    effect = "10032/FX_10032_skill3.prefab",
    prepare_effect = "10032/FX_10032_skill3_prepare.prefab",
    hit_effect = "10032/FX_10032_skill3_hit.prefab",
    effect_target = "10032/FX_10032_skill3_target.prefab",
    sound = {
      71013212,
      71013213,
      71013214,
      71013215
    },
    prepare_effect_sound = {71013211}
  },
  [42113351] = {
    id = 42113351,
    hurt_point = {
      "13:42113301:0"
    },
    spine_state = "skill1_1",
    effect = "10033/FX_10033_skill1_1.prefab",
    bullet_effect = "10033/FX_10033_skill1_1_bullet.prefab",
    bullet_hit_effect = "10033/FX_10033_skill1_1_hit.prefab",
    bullet_scale = 10000,
    sound = {71013301},
    bullet_sound = {71013302},
    bullet_hit_sound = {71013303}
  },
  [42113352] = {
    id = 42113352,
    hurt_point = {
      "13:42113301:0"
    },
    spine_state = "skill1_2",
    effect = "10033/FX_10033_skill1_2.prefab",
    bullet_effect = "10033/FX_10033_skill1_2_bullet.prefab",
    bullet_hit_effect = "10033/FX_10033_skill1_1_hit.prefab",
    bullet_scale = 10000,
    sound = {71013304, 71013305},
    bullet_sound = {71013306},
    bullet_hit_sound = {71013307}
  },
  [42313351] = {
    id = 42313351,
    hurt_point = {
      "15:42313301:0"
    },
    spine_state = "skill3",
    effect = "10033/FX_10033_skill3.prefab",
    prepare_effect = "10033/FX_10033_skill3_prepare.prefab",
    bullet_effect = "10033/FX_10033_skill3_bullet.prefab",
    bullet_scale = 10000,
    sound = {71013309},
    prepare_effect_sound = {71013308},
    bullet_hit_sound = {71013310},
    bend_scale = {3}
  },
  [42113451] = {
    id = 42113451,
    hurt_point = {
      "9:42113401:71013403",
      "18:42113402:71013403"
    },
    spine_state = "skill1_1",
    effect = "10034/FX_10034_skill1_1.prefab",
    remote_effect = "100:10034/FX_10034_skill1_bullet.prefab",
    hit_effect = "10034/FX_10034_skill1_hit.prefab",
    sound = {71013401, 71013402}
  },
  [42113452] = {
    id = 42113452,
    hurt_point = {
      "8:42113401:71013406",
      "21:42113402:71013406"
    },
    spine_state = "skill1_2",
    effect = "10034/FX_10034_skill1_2.prefab",
    remote_effect = "100:10034/FX_10034_skill1_2_bullet.prefab",
    hit_effect = "10034/FX_10034_skill1_hit.prefab",
    sound = {71013404, 71013405}
  },
  [42213451] = {
    id = 42213451,
    hurt_point = {
      "13:42213401:0"
    },
    spine_state = "skill2",
    effect = "10034/FX_10034_skill2.prefab",
    sound = {71013407}
  },
  [42313451] = {
    id = 42313451,
    hurt_point = {
      "2:42313401:71013411",
      "23:42313402:71013411"
    },
    spine_state = "skill3",
    effect = "10034/FX_10034_skill3.prefab",
    prepare_effect = "10034/FX_10034_skill3_prepare.prefab",
    hit_effect_list = {
      "10034/FX_10034_skill3_hit_01.prefab",
      "10034/FX_10034_skill3_hit_02.prefab"
    },
    sound = {71013409, 71013410},
    prepare_effect_sound = {71013408}
  },
  [42113551] = {
    id = 42113551,
    hurt_point = {
      "13:42113501:71013502"
    },
    spine_state = "skill1_1",
    effect = "10035/FX_10035_skill1_1.prefab",
    remote_effect = "100:10035/FX_10035_skill1_1_bullet.prefab",
    hit_effect = "10035/FX_10035_skill1_1_hit.prefab",
    sound = {71013501}
  },
  [42113552] = {
    id = 42113552,
    hurt_point = {
      "13:42113501:71013504"
    },
    spine_state = "skill1_2",
    effect = "10035/FX_10035_skill1_2.prefab",
    remote_effect = "100:10035/FX_10035_skill1_1_bullet.prefab",
    hit_effect = "10035/FX_10035_skill1_1_hit.prefab",
    sound = {71013503}
  },
  [42313551] = {
    id = 42313551,
    hurt_point = {
      "25:42313501:71013508"
    },
    spine_state = "skill3",
    effect = "10035/FX_10035_skill3.prefab",
    prepare_effect = "10035/FX_10035_skill3_prepare.prefab",
    effect_target = "10035/FX_10035_skill3_target.prefab",
    sound = {71013506, 71013507},
    prepare_effect_sound = {71013505}
  },
  [42113651] = {
    id = 42113651,
    hurt_point = {
      "22:42113601:0"
    },
    spine_state = "skill1",
    effect = "10036/FX_10036_skill1.prefab",
    bullet_effect = "10036/FX_10036_skill1_bullet.prefab",
    bullet_hit_effect = "10036/FX_10036_skill1_hit.prefab",
    bullet_scale = 10000,
    sound = {71013601},
    bullet_sound = {71013602},
    bullet_hit_sound = {71013603}
  },
  [42313651] = {
    id = 42313651,
    hurt_point = {
      "15:42313601:71013606"
    },
    spine_state = "skill3",
    effect = "10036/FX_10036_skill3.prefab",
    prepare_effect = "10036/FX_10036_skill3_prepare.prefab",
    effect_target = "10036/FX_10036_skill3_target.prefab",
    sound = {71013605},
    prepare_effect_sound = {71013604}
  },
  [42113751] = {
    id = 42113751,
    hurt_point = {
      "28:42113701:71013702"
    },
    spine_state = "skill1_1",
    effect = "10037/FX_10037_skill1_1.prefab",
    remote_effect = "100:10037/FX_10037_skill1_1_bullet.prefab",
    hit_effect = "10037/FX_10037_skill1_1_hit.prefab",
    sound = {71013701}
  },
  [42113752] = {
    id = 42113752,
    hurt_point = {
      "30:42113701:71013704"
    },
    spine_state = "skill1_2",
    effect = "10037/FX_10037_skill1_2.prefab",
    remote_effect = "100:10037/FX_10037_skill1_2_bullet.prefab",
    hit_effect = "10037/FX_10037_skill1_1_hit.prefab",
    sound = {71013703}
  },
  [42213751] = {
    id = 42213751,
    hurt_point = {
      "18:42213701:0"
    },
    spine_state = "skill2",
    effect = "10037/FX_10037_skill2.prefab",
    sound = {
      71013705,
      71013706,
      71013707
    }
  },
  [42313751] = {
    id = 42313751,
    hurt_point = {
      "10:42313701:0"
    },
    spine_state = "skill3",
    prepare_effect = "10037/FX_10037_skill3_prepare.prefab",
    sound = {71013709},
    prepare_effect_sound = {71013708}
  },
  [42113851] = {
    id = 42113851,
    hurt_point = {
      "28:42113801:71013802"
    },
    spine_state = "skill1_1",
    effect = "10038/FX_10038_skill1_1.prefab",
    remote_effect = "100:10038/FX_10038_skill1_bullet.prefab",
    hit_effect = "10038/FX_10038_skill1_hit.prefab",
    sound = {71013801}
  },
  [42113852] = {
    id = 42113852,
    hurt_point = {
      "28:42113801:71013804"
    },
    spine_state = "skill1_2",
    effect = "10038/FX_10038_skill1_2.prefab",
    remote_effect = "100:10038/FX_10038_skill1_bullet.prefab",
    hit_effect = "10038/FX_10038_skill1_hit.prefab",
    sound = {71013803}
  },
  [42313851] = {
    id = 42313851,
    hurt_point = {
      "50:42313801:0"
    },
    spine_state = "skill3",
    effect = "10038/FX_10038_skill3.prefab",
    prepare_effect = "10038/FX_10038_skill3_prepare.prefab",
    hit_effect = "10038/FX_10038_skill3_hit.prefab",
    sound = {
      71013806,
      71013807,
      71013808,
      71013809,
      71013810
    },
    prepare_effect_sound = {71013805}
  },
  [42413851] = {
    id = 42413851,
    hurt_point = {
      "18:42413801:0"
    },
    spine_state = "skillex1",
    effect = "10038/FX_10038_skillex1.prefab",
    bullet_effect = "10038/FX_10038_skillex1_bullet.prefab",
    bullet_hit_effect = "10038/FX_10038_skillex1_hit.prefab",
    bullet_scale = 10000
  },
  [42114051] = {
    id = 42114051,
    hurt_point = {
      "25:42114001:0"
    },
    spine_state = "skill1",
    effect = "10040/FX_10040_skill1.prefab",
    bullet_effect = "10040/FX_10040_skill1_bullet.prefab",
    bullet_hit_effect = "10040/FX_10040_skill1_hit.prefab",
    bullet_scale = 10000,
    sound = {71014001, 71014002},
    bullet_sound = {71014003},
    bullet_hit_sound = {71014004}
  },
  [42314051] = {
    id = 42314051,
    hurt_point = {
      "17:42314001:0"
    },
    spine_state = "skill3",
    effect = "10040/FX_10040_skill3.prefab",
    prepare_effect = "10040/FX_10040_skill3_prepare.prefab",
    sound = {71014006},
    prepare_effect_sound = {71014005}
  },
  [42114053] = {
    id = 42114053,
    hurt_point = {
      "25:42114003:0"
    },
    spine_state = "skill1",
    effect = "10040_1/FX_10040_1_skill1.prefab",
    bullet_effect = "10040_1/FX_10040_1_bullet.prefab",
    bullet_hit_effect = "10040_1/FX_10040_1_skill1_hit.prefab",
    bullet_scale = 10000
  },
  [42314053] = {
    id = 42314053,
    hurt_point = {
      "17:42314003:0"
    },
    spine_state = "skill3",
    effect = "10040_1/FX_10040_1_skill3.prefab",
    prepare_effect = "10040_1/FX_10040_1_skill3_prepare.prefab"
  },
  [42114151] = {
    id = 42114151,
    hurt_point = {
      "15:42114101:71014102"
    },
    spine_state = "skill1_1",
    effect = "10041/FX_10041_skill1_1.prefab",
    remote_effect = "100:10041/FX_10041_skill1_1_bullet.prefab",
    hit_effect = "10041/FX_10041_skill1_1_hit.prefab",
    sound = {71014101}
  },
  [42114152] = {
    id = 42114152,
    hurt_point = {
      "15:42114101:71014104"
    },
    spine_state = "skill1_2",
    effect = "10041/FX_10041_skill1_2.prefab",
    remote_effect = "100:10041/FX_10041_skill1_2_bullet.prefab",
    hit_effect = "10041/FX_10041_skill1_2_hit.prefab",
    sound = {71014103}
  },
  [42314151] = {
    id = 42314151,
    hurt_point = {
      "4:42314101:0"
    },
    spine_state = "skill3",
    effect = "10041/FX_10041_skill3.prefab",
    prepare_effect = "10041/FX_10041_skill3_prepare.prefab",
    effect_target = "10041/FX_10041_skill3_target.prefab",
    sound_target = {71014107},
    sound = {71014106},
    prepare_effect_sound = {71014105}
  },
  [42114251] = {
    id = 42114251,
    hurt_point = {
      "12:42114201:71014203",
      "23:42114202:71014203"
    },
    spine_state = "skill1_1",
    effect = "10042/FX_10042_skill1_1.prefab",
    remote_effect = "100:10042/FX_10042_skill1_1_bullet.prefab",
    hit_effect_list = {
      "10042/FX_10042_skill1_1_hit.prefab",
      "10042/FX_10042_skill1_1_hit_02.prefab"
    },
    sound = {71014201, 71014202}
  },
  [42114252] = {
    id = 42114252,
    hurt_point = {
      "12:42114201:71014206",
      "23:42114202:71014206"
    },
    spine_state = "skill1_2",
    effect = "10042/FX_10042_skill1_2.prefab",
    remote_effect = "100:10042/FX_10042_skill1_2_bullet.prefab",
    hit_effect_list = {
      "10042/FX_10042_skill1_1_hit.prefab",
      "10042/FX_10042_skill1_1_hit_02.prefab"
    },
    sound = {71014204, 71014205}
  },
  [42314251] = {
    id = 42314251,
    hurt_point = {
      "9:42314201:71014211",
      "13:42314202:0",
      "17:42314203:71014212",
      "43:42314204:71014213"
    },
    spine_state = "skill3",
    effect = "10042/FX_10042_skill3.prefab",
    prepare_effect = "10042/FX_10042_skill3_prepare.prefab",
    remote_effect = "0:10042/FX_10042_skill3_bullet.prefab",
    hit_effect_list = {
      "10042/FX_10042_skill3_hit_01.prefab",
      "",
      "10042/FX_10042_skill3_hit_01.prefab",
      "10042/FX_10042_skill3_hit_03.prefab"
    },
    sound = {
      71014208,
      71014209,
      71014210
    },
    prepare_effect_sound = {71014207}
  },
  [42114351] = {
    id = 42114351,
    hurt_point = {
      "18:42114301:71014302"
    },
    spine_state = "skill1_1",
    effect = "10043/FX_10043_skill1_1.prefab",
    remote_effect = "100:10043/FX_10043_skill1_1_bullet.prefab",
    hit_effect = "10043/FX_10043_skill1_hit.prefab",
    sound = {71014301}
  },
  [42114352] = {
    id = 42114352,
    hurt_point = {
      "20:42114301:71014304"
    },
    spine_state = "skill1_2",
    effect = "10043/FX_10043_skill1_2.prefab",
    remote_effect = "100:10043/FX_10043_skill1_1_bullet.prefab",
    hit_effect = "10043/FX_10043_skill1_hit.prefab",
    sound = {71014303}
  },
  [42114356] = {
    id = 42114356,
    hurt_point = {
      "18:42114306:0"
    },
    bullet_effect = "10043/FX_10043_skill1_buff_bullet.prefab",
    bullet_hit_effect = "10043/FX_10043_skill1_buff_hit.prefab",
    bullet_scale = 5000,
    bullet_speed = 1050
  },
  [42114357] = {
    id = 42114357,
    hurt_point = {
      "18:42114307:0"
    },
    bullet_effect = "10043/FX_10043_skill1_buff_bullet.prefab",
    bullet_hit_effect = "10043/FX_10043_skill1_buff_hit.prefab",
    bullet_scale = 5000,
    bullet_speed = 1050
  },
  [42114358] = {
    id = 42114358,
    hurt_point = {
      "18:42114308:0"
    },
    bullet_effect = "10043/FX_10043_skill1_buff_bullet.prefab",
    bullet_hit_effect = "10043/FX_10043_skill1_buff_hit.prefab",
    bullet_scale = 5000,
    bullet_speed = 1050
  },
  [42114359] = {
    id = 42114359,
    hurt_point = {
      "18:42114309:0"
    },
    bullet_effect = "10043/FX_10043_skill1_buff_bullet.prefab",
    bullet_hit_effect = "10043/FX_10043_skill1_buff_hit.prefab",
    bullet_scale = 5000,
    bullet_speed = 1050
  },
  [42114360] = {
    id = 42114360,
    hurt_point = {
      "18:42114310:0"
    },
    bullet_effect = "10043/FX_10043_skill1_buff_bullet.prefab",
    bullet_hit_effect = "10043/FX_10043_skill1_buff_hit.prefab",
    bullet_scale = 5000,
    bullet_speed = 1050
  },
  [42114361] = {
    id = 42114361,
    hurt_point = {
      "18:42114311:0"
    },
    bullet_effect = "10043/FX_10043_skill1_buff_bullet.prefab",
    bullet_hit_effect = "10043/FX_10043_skill1_buff_hit.prefab",
    bullet_scale = 5000,
    bullet_speed = 1050
  },
  [42314351] = {
    id = 42314351,
    hurt_point = {
      "20:42314301:71014310",
      "31:42314302:71014311"
    },
    spine_state = "skill3",
    effect = "10043/FX_10043_skill3.prefab",
    prepare_effect = "10043/FX_10043_skill3_prepare.prefab",
    hit_effect_list = {
      "10043/FX_10043_skill3_hit.prefab",
      ""
    },
    sound = {71014309},
    prepare_effect_sound = {71014308}
  },
  [42314356] = {
    id = 42314356,
    hurt_point = {
      "31:42314306:0"
    },
    bullet_effect = "10043/FX_10043_skill3_buff_bullet.prefab",
    bullet_hit_effect = "10043/FX_10043_skill3_buff_hit.prefab",
    bullet_scale = 5000,
    bullet_speed = 1050
  },
  [42114451] = {
    id = 42114451,
    hurt_point = {
      "16:42114401:71014402"
    },
    spine_state = "skill1",
    effect = "10012/FX_10012_skill1.prefab",
    hit_effect = "10012/FX_10012_skill1_hit.prefab",
    sound = {71014401}
  },
  [42214451] = {
    id = 42214451,
    hurt_point = {
      "17:42214401:71014407",
      "32:42214402:71014407"
    },
    spine_state = "skill3",
    effect = "10012/FX_10012_skill3.prefab",
    hit_effect = "10012/FX_10012_skill3_hit.prefab",
    sound = {
      71014404,
      71014405,
      71014406
    }
  },
  [42314451] = {id = 42314451, spine_state = "skill1"},
  [42114551] = {
    id = 42114551,
    hurt_point = {
      "22:42114501:0"
    },
    spine_state = "skill1_1",
    effect = "10045/FX_10045_skill1_1.prefab",
    bullet_effect = "10045/FX_10045_skill1_1_bullet.prefab",
    bullet_hit_effect = "10045/FX_10045_skill1_1_hit.prefab",
    bullet_scale = 10000,
    sound = {71014501, 71014502},
    bullet_sound = {71014503},
    bullet_hit_sound = {71014504}
  },
  [42114552] = {
    id = 42114552,
    hurt_point = {
      "22:42114501:0"
    },
    spine_state = "skill1_2",
    effect = "10045/FX_10045_skill1_2.prefab",
    bullet_effect = "10045/FX_10045_skill1_2_bullet.prefab",
    bullet_hit_effect = "10045/FX_10045_skill1_1_hit.prefab",
    bullet_scale = 10000,
    sound = {71014505, 71014506},
    bullet_sound = {71014507},
    bullet_hit_sound = {71014508}
  },
  [42314551] = {
    id = 42314551,
    hurt_point = {
      "22:42314501:71014512",
      "28:42314502:71014512",
      "34:42314503:71014512",
      "41:42314504:71014512"
    },
    spine_state = "skill3",
    effect = "10045/FX_10045_skill3.prefab",
    prepare_effect = "10045/FX_10045_skill3_prepare.prefab",
    hit_effect = "10045/FX_10045_skill3_hit.prefab",
    sound = {71014510, 71014511},
    prepare_effect_sound = {71014509}
  },
  [42114553] = {
    id = 42114553,
    hurt_point = {
      "22:42114503:0"
    },
    spine_state = "skill1_1",
    effect = "10045_1/FX_10045_1_skill1_1.prefab",
    bullet_effect = "10045_1/FX_10045_1_skill1_1_bullet.prefab",
    bullet_hit_effect = "10045_1/FX_10045_1_skill1_1_hit.prefab",
    bullet_scale = 10000,
    sound = {71114501},
    bullet_hit_sound = {71114502}
  },
  [42114554] = {
    id = 42114554,
    hurt_point = {
      "22:42114503:0"
    },
    spine_state = "skill1_2",
    effect = "10045_1/FX_10045_1_skill1_2.prefab",
    bullet_effect = "10045_1/FX_10045_1_skill1_2_bullet.prefab",
    bullet_hit_effect = "10045_1/FX_10045_1_skill1_2_hit.prefab",
    bullet_scale = 10000,
    sound = {71114503, 71114504},
    bullet_hit_sound = {71114505}
  },
  [42314553] = {
    id = 42314553,
    hurt_point = {
      "22:42314505:71114509",
      "28:42314506:71114509",
      "34:42314507:71114509",
      "41:42314508:71114509"
    },
    spine_state = "skill3",
    effect = "10045_1/FX_10045_1_skill3.prefab",
    prepare_effect = "10045_1/FX_10045_1_skill3_prepare.prefab",
    hit_effect = "10045_1/FX_10045_1_skill3_hit.prefab",
    sound = {71114507, 71114508},
    prepare_effect_sound = {71114506},
    end_points = {"hit"}
  },
  [42114651] = {
    id = 42114651,
    hurt_point = {
      "26:42114601:0"
    },
    spine_state = "skill1_1",
    effect = "10014/FX_10014_skill1_1.prefab",
    bullet_effect = "10014/FX_10014_skill1_1_bullet.prefab",
    bullet_hit_effect = "10014/FX_10014_skill1_1_hit.prefab",
    bullet_scale = 10000,
    sound = {71014601, 71014602},
    bullet_sound = {71014603},
    bullet_hit_sound = {71014604},
    buff_change_show = "523:42214651"
  },
  [42114652] = {
    id = 42114652,
    hurt_point = {
      "26:42114601:0"
    },
    spine_state = "skill1_2",
    effect = "10014/FX_10014_skill1_2.prefab",
    bullet_effect = "10014/FX_10014_skill1_1_bullet.prefab",
    bullet_hit_effect = "10014/FX_10014_skill1_1_hit.prefab",
    bullet_scale = 10000,
    sound = {71014605, 71014606},
    bullet_sound = {71014607},
    bullet_hit_sound = {71014608},
    buff_change_show = "523:42214651"
  },
  [42314651] = {
    id = 42314651,
    hurt_point = {
      "1:42314601:0"
    },
    spine_state = "skill3",
    effect = "10014/FX_10014_skill3.prefab",
    prepare_effect = "10014/FX_10014_skill3_prepare.prefab",
    sound = {71014610},
    prepare_effect_sound = {71014609}
  },
  [42214651] = {
    id = 42214651,
    hurt_point = {
      "1:42214601:0",
      "12:42214602:0"
    },
    spine_state = "skill1_3",
    effect = "10014/FX_10014_skill1_3.prefab",
    bullet_effect = "10014/FX_10014_skill1_3_bullet.prefab",
    bullet_hit_effect = "10014/FX_10014_skill1_3_hit.prefab",
    bullet_scale = 10000,
    sound = {71014611, 71014612},
    bullet_sound = {71014613},
    bullet_hit_sound = {71014614},
    bend_scale = {1, -1}
  },
  [42114653] = {
    id = 42114653,
    hurt_point = {
      "26:42114603:0"
    },
    spine_state = "skill1_1",
    effect = "10014_1/FX_10014_1_skill1_1.prefab",
    bullet_effect = "10014_1/FX_10014_1_skill1_1_bullet.prefab",
    bullet_hit_effect = "10014_1/FX_10014_1_skill1_1_hit.prefab",
    bullet_scale = 10000,
    sound = {71114601, 71114602},
    bullet_sound = {71114603},
    bullet_hit_sound = {71114604},
    buff_change_show = "523:42214653"
  },
  [42114654] = {
    id = 42114654,
    hurt_point = {
      "26:42114603:0"
    },
    spine_state = "skill1_2",
    effect = "10014_1/FX_10014_1_skill1_2.prefab",
    bullet_effect = "10014_1/FX_10014_1_skill1_1_bullet.prefab",
    bullet_hit_effect = "10014_1/FX_10014_1_skill1_1_hit.prefab",
    bullet_scale = 10000,
    sound = {71114605, 71114606},
    bullet_sound = {71114607},
    bullet_hit_sound = {71114608},
    buff_change_show = "523:42214653"
  },
  [42314653] = {
    id = 42314653,
    hurt_point = {
      "1:42314603:0"
    },
    spine_state = "skill3",
    effect = "10014_1/FX_10014_1_skill3.prefab",
    prepare_effect = "10014_1/FX_10014_1_skill3_prepare.prefab",
    sound = {71114610},
    prepare_effect_sound = {71114609}
  },
  [42214653] = {
    id = 42214653,
    hurt_point = {
      "1:42214603:0",
      "12:42214604:0"
    },
    spine_state = "skill1_3",
    effect = "10014_1/FX_10014_1_skill1_3.prefab",
    bullet_effect = "10014_1/FX_10014_1_skill1_3_bullet.prefab",
    bullet_hit_effect = "10014_1/FX_10014_1_skill1_3_hit.prefab",
    bullet_scale = 10000,
    sound = {71114611, 71114612},
    bend_scale = {1, -1}
  },
  [42114751] = {
    id = 42114751,
    hurt_point = {
      "17:42114701:0"
    },
    spine_state = "skill1_1",
    effect = "10047/FX_10047_skill1_1.prefab",
    remote_effect = "100:10047/FX_10047_skill1_1_bullet.prefab",
    hit_effect = "10047/FX_10047_skill1_1_hit.prefab",
    sound = {71014701, 71014702}
  },
  [42114752] = {
    id = 42114752,
    hurt_point = {
      "17:42114701:0"
    },
    spine_state = "skill1_2",
    effect = "10047/FX_10047_skill1_2.prefab",
    remote_effect = "100:10047/FX_10047_skill1_2_bullet.prefab",
    hit_effect = "10047/FX_10047_skill1_2_hit.prefab",
    sound = {71014703, 71014704}
  },
  [42314751] = {
    id = 42314751,
    hurt_point = {
      "17:42314701:0",
      "32:42314702:0"
    },
    spine_state = "skill3",
    effect = "10047/FX_10047_skill3.prefab",
    prepare_effect = "10047/FX_10047_skill3_prepare.prefab",
    hit_effect_list = {
      "10047/FX_10047_skill3_hit.prefab",
      "10047/FX_10047_skill3_hit_02.prefab"
    },
    sound = {
      71014706,
      71014707,
      71014708
    },
    prepare_effect_sound = {71014705}
  },
  [42114851] = {
    id = 42114851,
    hurt_point = {
      "31:42114801:71014803"
    },
    spine_state = "skill1_1",
    effect = "10048/FX_10048_skill1_1.prefab",
    hit_effect = "10048/FX_10048_skill1_1_hit.prefab",
    sound = {71014801, 71014802}
  },
  [42114852] = {
    id = 42114852,
    hurt_point = {
      "31:42114801:71014806"
    },
    spine_state = "skill1_2",
    effect = "10048/FX_10048_skill1_2.prefab",
    hit_effect = "10048/FX_10048_skill1_1_hit.prefab",
    sound = {71014804, 71014805}
  },
  [42214851] = {
    id = 42214851,
    hurt_point = {
      "24:42214801:0"
    },
    spine_state = "skill2",
    effect = "10048/FX_10048_skill2.prefab",
    bullet_effect = "10048/FX_10048_skill2_bullet.prefab",
    bullet_hit_effect = "10048/FX_10048_skill2_hit.prefab",
    bullet_scale = 10000,
    sound = {71014807, 71014808},
    bullet_sound = {71014809},
    bullet_hit_sound = {71014810},
    bend_scale = {1},
    start_points = {"bullet"}
  },
  [42314851] = {
    id = 42314851,
    hurt_point = {
      "1:42314801:0"
    },
    spine_state = "skill3",
    effect = "10048/FX_10048_skill3.prefab",
    prepare_effect = "10048/FX_10048_skill3_prepare.prefab",
    effect_line = "10048/FX_10048_skill3_line.prefab",
    bomb_effect_target = "10048/FX_10048_skill3_target.prefab",
    bomb_sound_target_hit = 71014813,
    sound = {71014812},
    prepare_effect_sound = {71014811}
  },
  [42114951] = {
    id = 42114951,
    hurt_point = {
      "21:42114901:0"
    },
    spine_state = "skill1_1",
    effect = "10049/FX_10049_skill1_1.prefab",
    bullet_effect = "10049/FX_10049_skill1_1_bullet.prefab",
    bullet_hit_effect = "10049/FX_10049_skill1_1_hit.prefab",
    bullet_scale = 10000,
    sound = {71014901, 71014902},
    bullet_sound = {71014903},
    bullet_hit_sound = {71014904}
  },
  [42114952] = {
    id = 42114952,
    hurt_point = {
      "21:42114901:0"
    },
    spine_state = "skill1_2",
    effect = "10049/FX_10049_skill1_2.prefab",
    bullet_effect = "10049/FX_10049_skill1_2_bullet.prefab",
    bullet_hit_effect = "10049/FX_10049_skill1_1_hit.prefab",
    bullet_scale = 10000,
    sound = {71014905, 71014906},
    bullet_sound = {71014907},
    bullet_hit_sound = {71014908}
  },
  [42314951] = {
    id = 42314951,
    hurt_point = {
      "27:42314901:0"
    },
    spine_state = "skill3",
    effect = "10049/FX_10049_skill3.prefab",
    prepare_effect = "10049/FX_10049_skill3_prepare.prefab",
    effect_target = "10049/FX_10049_skill3_target.prefab",
    sound = {71014910, 71014911},
    prepare_effect_sound = {71014909}
  },
  [42115051] = {
    id = 42115051,
    hurt_point = {
      "14:42115001:71015002"
    },
    spine_state = "skill1_1",
    effect = "10050/FX_10050_skill1_1.prefab",
    remote_effect = "100:10050/FX_10050_skill1_1_bullet.prefab",
    hit_effect = "10050/FX_10050_skill1_1_hit.prefab",
    sound = {71015001}
  },
  [42115052] = {
    id = 42115052,
    hurt_point = {
      "14:42115001:71015005"
    },
    spine_state = "skill1_2",
    effect = "10050/FX_10050_skill1_2.prefab",
    remote_effect = "100:10050/FX_10050_skill1_2_bullet.prefab",
    hit_effect = "10050/FX_10050_skill1_1_hit.prefab",
    sound = {71015003, 71015004}
  },
  [42315051] = {
    id = 42315051,
    hurt_point = {
      "4:42315001:71015009",
      "19:42315002:71015009",
      "23:42315003:71015009",
      "27:42315004:71015009",
      "32:42315005:71015009"
    },
    spine_state = "skill3",
    effect = "10050/FX_10050_skill3.prefab",
    prepare_effect = "10050/FX_10050_skill3_prepare.prefab",
    remote_effect = "0:10050/FX_10050_skill3_bullet.prefab",
    hit_effect = "10050/FX_10050_skill3_hit.prefab",
    effect_target = "10050/FX_10050_skill3_target.prefab",
    sound = {71015007, 71015008},
    prepare_effect_sound = {71015006}
  },
  [42115151] = {
    id = 42115151,
    hurt_point = {
      "9:42115101:71015103",
      "15:42115102:71015103"
    },
    spine_state = "skill1_1",
    effect = "10051/FX_10051_skill1_1.prefab",
    remote_effect = "100:10051/FX_10051_skill1_1_bullet.prefab",
    hit_effect = "10051/FX_10051_skill1_1_hit.prefab",
    sound = {71015101, 71015102}
  },
  [42115152] = {
    id = 42115152,
    hurt_point = {
      "9:42115101:71115106",
      "15:42115102:71115106"
    },
    spine_state = "skill1_2",
    effect = "10051/FX_10051_skill1_2.prefab",
    remote_effect = "100:10051/FX_10051_skill1_1_bullet.prefab",
    hit_effect = "10051/FX_10051_skill1_1_hit.prefab",
    sound = {71015104, 71015105}
  },
  [42315151] = {
    id = 42315151,
    hurt_point = {
      "20:42315101:0"
    },
    spine_state = "skill3",
    effect = "10051/FX_10051_skill3.prefab",
    prepare_effect = "10051/FX_10051_skill3_prepare.prefab",
    hit_effect = "10051/FX_10051_skill3_hit.prefab",
    sound = {71015108},
    prepare_effect_sound = {71015107}
  },
  [42115153] = {
    id = 42115153,
    hurt_point = {
      "9:42115103:71115103",
      "15:42115104:71115103"
    },
    spine_state = "skill1_1",
    effect = "10051_1/FX_10051_1_skill1_1.prefab",
    remote_effect = "100:10051_1/FX_10051_1_skill1_bullet.prefab",
    hit_effect = "10051_1/FX_10051_1_skill1_hit.prefab",
    sound = {71115101, 71115102}
  },
  [42115154] = {
    id = 42115154,
    hurt_point = {
      "9:42115103:71115106",
      "15:42115104:71115106"
    },
    spine_state = "skill1_2",
    effect = "10051_1/FX_10051_1_skill1_2.prefab",
    remote_effect = "100:10051_1/FX_10051_1_skill1_bullet.prefab",
    hit_effect = "10051_1/FX_10051_1_skill1_hit.prefab",
    sound = {71115104, 71115105}
  },
  [42315153] = {
    id = 42315153,
    hurt_point = {
      "20:42315103:0"
    },
    spine_state = "skill3",
    effect = "10051_1/FX_10051_1_skill3.prefab",
    prepare_effect = "10051_1/FX_10051_1_skill3_prepare.prefab",
    hit_effect = "10051_1/FX_10051_1_skill3_hit.prefab",
    sound = {71115108},
    prepare_effect_sound = {71115107}
  },
  [42115251] = {
    id = 42115251,
    hurt_point = {
      "21:42115201:71015202"
    },
    spine_state = "skill1",
    effect = "10009/FX_10009_skill1.prefab",
    remote_effect = "100:10009/FX_10009_skill1_bullet.prefab",
    hit_effect = "10009/FX_10009_skill1_hit.prefab",
    sound = {71015201}
  },
  [42315251] = {
    id = 42315251,
    hurt_point = {
      "5:42315201:71015205",
      "16:42315202:71015206"
    },
    spine_state = "skill3",
    effect = "10009/FX_10009_skill3.prefab",
    prepare_effect = "10009/FX_10009_skill3_prepare.prefab",
    hit_effect_list = {
      "10009/FX_10009_skill3_hit01.prefab",
      "10009/FX_10009_skill3_hit02.prefab"
    },
    sound = {71015204},
    prepare_effect_sound = {71015203}
  },
  [42115351] = {
    id = 42115351,
    hurt_point = {
      "21:42115301:0"
    },
    spine_state = "skill1_1",
    effect = "10053/FX_10053_skill1_1.prefab",
    bullet_effect = "10053/FX_10053_skill1_1_bullet.prefab",
    bullet_hit_effect = "10053/FX_10053_skill1_1_hit.prefab",
    bullet_scale = 10000,
    sound = {71015301, 71015302},
    bullet_sound = {71015303},
    bullet_hit_sound = {71015304},
    bend_scale = {1}
  },
  [42115352] = {
    id = 42115352,
    hurt_point = {
      "21:42115301:0"
    },
    spine_state = "skill1_2",
    effect = "10053/FX_10053_skill1_2.prefab",
    bullet_effect = "10053/FX_10053_skill1_1_bullet.prefab",
    bullet_hit_effect = "10053/FX_10053_skill1_1_hit.prefab",
    bullet_scale = 10000,
    sound = {71015305, 71015306},
    bullet_sound = {71015307},
    bullet_hit_sound = {71015308},
    bend_scale = {1}
  },
  [42315351] = {
    id = 42315351,
    hurt_point = {
      "13:42315301:71015313",
      "20:42315302:71015314",
      "35:42315303:71015315"
    },
    spine_state = "skill3",
    effect = "10053/FX_10053_skill3.prefab",
    prepare_effect = "10053/FX_10053_skill3_prepare.prefab",
    hit_effect = "10053/FX_10053_skill3_hit.prefab",
    effect_target = "10053/FX_10053_skill3_target.prefab",
    sound = {
      71015310,
      71015311,
      71015312
    },
    prepare_effect_sound = {71015309},
    effect_target_limit = 1
  },
  [42115451] = {
    id = 42115451,
    hurt_point = {
      "15:42115401:71015403"
    },
    spine_state = "skill1_1",
    effect = "10054/FX_10054_skill1_1.prefab",
    remote_effect = "100:10054/FX_10054_skill1_1_bullet.prefab",
    hit_effect = "10054/FX_10054_skill1_1_hit.prefab",
    sound = {71015401, 71015402}
  },
  [42115452] = {
    id = 42115452,
    hurt_point = {
      "15:42115401:71015405"
    },
    spine_state = "skill1_2",
    effect = "10054/FX_10054_skill1_2.prefab",
    remote_effect = "100:10054/FX_10054_skill1_2_bullet.prefab",
    hit_effect = "10054/FX_10054_skill1_1_hit.prefab",
    sound = {71015404}
  },
  [42315451] = {
    id = 42315451,
    hurt_point = {
      "37:42315401:0"
    },
    spine_state = "skill3",
    effect = "10054/FX_10054_skill3.prefab",
    prepare_effect = "10054/FX_10054_skill3_prepare.prefab",
    sound = {
      71015407,
      71015408,
      71015409,
      71015410
    },
    prepare_effect_sound = {71015406}
  },
  [42115551] = {
    id = 42115551,
    hurt_point = {
      "22:42115501:0"
    },
    spine_state = "skill1_1",
    effect = "10055/FX_10055_skill1_1.prefab",
    bullet_effect = "10055/FX_10055_skill1_1_bullet.prefab",
    bullet_hit_effect = "10055/FX_10055_skill1_1_hit.prefab",
    bullet_scale = 10000,
    sound = {71015501, 71015502},
    bullet_sound = {71015503},
    bullet_hit_sound = {71015504},
    start_points = {"zero"},
    end_points = {"zero"}
  },
  [42115552] = {
    id = 42115552,
    hurt_point = {
      "22:42115501:0"
    },
    spine_state = "skill1_2",
    effect = "10055/FX_10055_skill1_2.prefab",
    bullet_effect = "10055/FX_10055_skill1_2_bullet.prefab",
    bullet_hit_effect = "10055/FX_10055_skill1_2_hit.prefab",
    bullet_scale = 10000,
    sound = {71015505, 71015506},
    bullet_sound = {71015507},
    bullet_hit_sound = {71015508}
  },
  [42315551] = {
    id = 42315551,
    hurt_point = {
      "13:42315501:71015512"
    },
    spine_state = "skill3",
    effect = "10055/FX_10055_skill3.prefab",
    prepare_effect = "10055/FX_10055_skill3_prepare.prefab",
    effect_target = "10055/FX_10055_skill3_target.prefab",
    sound_target = {71015511},
    sound = {71015510},
    prepare_effect_sound = {71015509}
  },
  [42116151] = {
    id = 42116151,
    hurt_point = {
      "5:42116101:71116103",
      "9:42116102:71116103"
    },
    spine_state = "skill1_1",
    effect = "10061/FX_10061_skill1_1.prefab",
    hit_effect = "10061/FX_10061_skill1_1_hit.prefab",
    sound = {71016101, 71016102}
  },
  [42116152] = {
    id = 42116152,
    hurt_point = {
      "5:42116101:71116106",
      "9:42116102:71116106"
    },
    spine_state = "skill1_2",
    effect = "10061/FX_10061_skill1_2.prefab",
    hit_effect = "10061/FX_10061_skill1_1_hit.prefab",
    sound = {71016104, 71016105}
  },
  [42216151] = {
    id = 42216151,
    hurt_point = {
      "6:42216101:71116108"
    },
    spine_state = "skill2",
    effect = "10061/FX_10061_skill2.prefab",
    hit_effect = "10061/FX_10061_skill2_hit.prefab",
    sound = {71016107}
  },
  [42316151] = {
    id = 42316151,
    hurt_point = {
      "16:42316101:0"
    },
    spine_state = "skill3",
    effect = "10061/FX_10061_skill3.prefab",
    prepare_effect = "10061/FX_10061_skill3_prepare.prefab",
    hit_effect = "10061/FX_10061_skill3_hit.prefab",
    sound = {71016110},
    prepare_effect_sound = {71016109}
  },
  [42316152] = {
    id = 42316152,
    hurt_point = {
      "21:42316102:0"
    },
    spine_state = "skill4_insert",
    effect = "10061/FX_10061_skill4_insert.prefab",
    sound = {71016111}
  },
  [42316153] = {
    id = 42316153,
    hurt_point = {
      "6:42316103:71116115",
      "9:42316104:71116115",
      "13:42316105:71116115",
      "17:42316106:71116115",
      "21:42316107:71116115"
    },
    spine_state = "skill4",
    effect = "10061/FX_10061_skill4.prefab",
    hit_effect = "10061/FX_10061_skill4_hit.prefab",
    sound = {71016114}
  },
  [42116154] = {
    id = 42116154,
    hurt_point = {
      "5:42116101:71116106",
      "9:42116102:71116106"
    },
    spine_state = "skill1_1",
    effect = "10061_1/FX_10061_1_skill1_1.prefab",
    hit_effect = "10061_1/FX_10061_1_skill1_1_hit.prefab",
    sound = {71116101, 71116102}
  },
  [42116155] = {
    id = 42116155,
    hurt_point = {
      "5:42116101:71116106",
      "9:42116102:71116106"
    },
    spine_state = "skill1_2",
    effect = "10061_1/FX_10061_1_skill1_2.prefab",
    hit_effect = "10061_1/FX_10061_1_skill1_1_hit.prefab",
    sound = {71116104, 71116105}
  },
  [42216154] = {
    id = 42216154,
    hurt_point = {
      "6:42216101:71116108"
    },
    spine_state = "skill2",
    effect = "10061_1/FX_10061_1_skill2.prefab",
    hit_effect = "10061_1/FX_10061_1_skill2_hit.prefab",
    sound = {71116107}
  },
  [42316154] = {
    id = 42316154,
    hurt_point = {
      "16:42316101:0"
    },
    spine_state = "skill3",
    effect = "10061_1/FX_10061_1_skill3.prefab",
    prepare_effect = "10061_1/FX_10061_1_skill3_prepare.prefab",
    hit_effect = "10061_1/FX_10061_1_skill3_hit.prefab",
    sound = {71116110},
    prepare_effect_sound = {71116109}
  },
  [42316155] = {
    id = 42316155,
    hurt_point = {
      "21:42316102:0"
    },
    spine_state = "skill4_insert",
    effect = "10061_1/FX_10061_1_skill4_insert.prefab",
    sound = {71116111}
  },
  [42316156] = {
    id = 42316156,
    hurt_point = {
      "6:42316103:71116115",
      "9:42316104:71116115",
      "13:42316105:71116115",
      "17:42316106:71116115",
      "21:42316107:71116115"
    },
    spine_state = "skill4",
    effect = "10061_1/FX_10061_1_skill4.prefab",
    hit_effect = "10061_1/FX_10061_1_skill4_hit.prefab",
    sound = {71116114}
  },
  [42117051] = {
    id = 42117051,
    hurt_point = {
      "23:42117001:0"
    },
    spine_state = "skill1_1",
    effect = "10070/FX_10070_skill1.prefab",
    bullet_effect = "10070/FX_10070_skill1_bullet.prefab",
    bullet_hit_effect = "10070/FX_10070_skill1_hit.prefab",
    bullet_scale = 10000,
    sound = {71017001, 71017002},
    bullet_sound = {71017003},
    bullet_hit_sound = {71017004},
    bend_scale = {1}
  },
  [42117052] = {
    id = 42117052,
    hurt_point = {
      "23:42117001:0"
    },
    spine_state = "skill1_2",
    effect = "10070/FX_10070_skill1.prefab",
    bullet_effect = "10070/FX_10070_skill1_bullet.prefab",
    bullet_hit_effect = "10070/FX_10070_skill1_hit.prefab",
    bullet_scale = 10000,
    sound = {71017005, 71017006},
    bullet_sound = {71017007},
    bullet_hit_sound = {71017008},
    bend_scale = {1}
  },
  [42317051] = {
    id = 42317051,
    hurt_point = {
      "15:42317001:0",
      "19:42317002:0",
      "23:42317003:0",
      "27:42317004:0",
      "31:42317005:0"
    },
    spine_state = "skill3",
    effect = "10070/FX_10070_skill3.prefab",
    prepare_effect = "10070/FX_10070_skill3_prepare.prefab",
    bomb_effect_target = "10070/FX_10070_skill3_target.prefab",
    bomb_sound_target_hit = 71017011,
    sound = {71017010},
    prepare_effect_sound = {71017009}
  },
  [42117053] = {
    id = 42117053,
    hurt_point = {
      "23:42117003:0"
    },
    spine_state = "skill1_1",
    effect = "10070_1/FX_10070_1_skill1_1.prefab",
    bullet_effect = "10070_1/FX_10070_1_skill1_1_bullet.prefab",
    bullet_hit_effect = "10070_1/FX_10070_1_skill1_1_hit.prefab",
    bullet_scale = 10000,
    sound = {71117001, 71117002},
    bullet_hit_sound = {71117003},
    bend_scale = {1}
  },
  [42117054] = {
    id = 42117054,
    hurt_point = {
      "23:42117003:0"
    },
    spine_state = "skill1_2",
    effect = "10070_1/FX_10070_1_skill1_1.prefab",
    bullet_effect = "10070_1/FX_10070_1_skill1_1_bullet.prefab",
    bullet_hit_effect = "10070_1/FX_10070_1_skill1_1_hit.prefab",
    bullet_scale = 10000,
    sound = {71117004, 71117005},
    bullet_hit_sound = {71117006},
    bend_scale = {1}
  },
  [42317053] = {
    id = 42317053,
    hurt_point = {
      "15:42317006:0",
      "19:42317007:0",
      "23:42317008:0",
      "27:42317009:0",
      "31:42317010:0"
    },
    spine_state = "skill3",
    effect = "10070_1/FX_10070_1_skill3.prefab",
    prepare_effect = "10070_1/FX_10070_1_skill3_prepare.prefab",
    bomb_effect_target = "10070_1/FX_10070_1_skill3_target.prefab",
    bomb_sound_target_hit = 71117009,
    sound = {71117008},
    prepare_effect_sound = {71117007}
  },
  [42118051] = {
    id = 42118051,
    hurt_point = {
      "15:42118001:71018003",
      "33:42118002:71018003"
    },
    spine_state = "skill1",
    effect = "10080/FX_10080_skill1.prefab",
    hit_effect = "10080/FX_10080_skill1_hit.prefab",
    sound = {71018001, 71018002}
  },
  [42318051] = {
    id = 42318051,
    hurt_point = {
      "5:42318001:0",
      "24:42318002:0",
      "31:42318003:0",
      "57:42318004:0"
    },
    spine_state = "skill3",
    effect = "10080/FX_10080_skill3.prefab",
    prepare_effect = "10080/FX_10080_skill3_prepare.prefab",
    hit_effect = "10080/FX_10080_skill3_hit.prefab",
    sound = {
      71018008,
      71018009,
      71018010
    },
    prepare_effect_sound = {71018007}
  },
  [42118053] = {
    id = 42118053,
    hurt_point = {
      "15:42118001:71118003",
      "33:42118002:71118003"
    },
    spine_state = "skill1",
    effect = "10080_1/FX_10080_1_skill1.prefab",
    hit_effect = "10080/FX_10080_skill1_hit.prefab",
    sound = {71118001, 71118002}
  },
  [42318053] = {
    id = 42318053,
    hurt_point = {
      "5:42318001:0",
      "24:42318002:0",
      "31:42318003:0",
      "57:42318004:0"
    },
    spine_state = "skill3",
    effect = "10080_1/FX_10080_1_skill3.prefab",
    prepare_effect = "10080_1/FX_10080_1_skill3_prepare.prefab",
    hit_effect = "10080/FX_10080_skill3_hit.prefab",
    sound = {
      71118008,
      71118009,
      71118010
    },
    prepare_effect_sound = {71118007}
  },
  [42113951] = {
    id = 42113951,
    hurt_point = {
      "17:42113901:0"
    },
    spine_state = "skill1_1",
    effect = "10039/FX_10039_skill1_1.prefab",
    bullet_effect = "10039/FX_10039_skill1_1_bullet.prefab",
    bullet_hit_effect = "10039/FX_10039_skill1_1_hit.prefab",
    bullet_scale = 10000,
    sound = {71013901},
    bullet_hit_sound = {71013902}
  },
  [42113952] = {
    id = 42113952,
    hurt_point = {
      "17:42113901:0"
    },
    spine_state = "skill1_2",
    effect = "10039/FX_10039_skill1_2.prefab",
    bullet_effect = "10039/FX_10039_skill1_1_bullet.prefab",
    bullet_hit_effect = "10039/FX_10039_skill1_1_hit.prefab",
    bullet_scale = 10000,
    sound = {71013903},
    bullet_hit_sound = {71013904}
  },
  [42313951] = {
    id = 42313951,
    hurt_point = {
      "27:42313901:0"
    },
    spine_state = "skill3",
    effect = "10039/FX_10039_skill3.prefab",
    prepare_effect = "10039/FX_10039_skill3_prepare.prefab",
    effect_target = "10039/FX_10039_skill3_target.prefab",
    sound_target = {71013907},
    sound = {71013906},
    prepare_effect_sound = {71013905}
  },
  [42113953] = {
    id = 42113953,
    hurt_point = {
      "17:42113901:0"
    },
    spine_state = "skill1_1",
    effect = "10039_1/FX_10039_1_skill1_1.prefab",
    bullet_effect = "10039_1/FX_10039_1_skill1_1_bullet.prefab",
    bullet_hit_effect = "10039_1/FX_10039_1_skill1_1_hit.prefab",
    bullet_scale = 10000,
    sound = {71113901},
    bullet_hit_sound = {71113902}
  },
  [42113954] = {
    id = 42113954,
    hurt_point = {
      "17:42113901:0"
    },
    spine_state = "skill1_2",
    effect = "10039_1/FX_10039_1_skill1_2.prefab",
    bullet_effect = "10039_1/FX_10039_1_skill1_1_bullet.prefab",
    bullet_hit_effect = "10039_1/FX_10039_1_skill1_1_hit.prefab",
    bullet_scale = 10000,
    sound = {71113903},
    bullet_hit_sound = {71113904}
  },
  [42313953] = {
    id = 42313953,
    hurt_point = {
      "27:42313901:0"
    },
    spine_state = "skill3",
    effect = "10039_1/FX_10039_1_skill3.prefab",
    prepare_effect = "10039_1/FX_10039_1_skill3_prepare.prefab",
    effect_target = "10039_1/FX_10039_1_skill3_target.prefab",
    sound_target = {71113907},
    sound = {71113906},
    prepare_effect_sound = {71113905}
  },
  [42116951] = {
    id = 42116951,
    hurt_point = {
      "26:42116901:0"
    },
    spine_state = "skill1_1",
    bullet_effect = "10039/FX_10039_skill1_1_bullet.prefab",
    bullet_hit_effect = "10039/FX_10039_skill1_1_hit.prefab",
    bullet_scale = 10000
  },
  [42116952] = {
    id = 42116952,
    hurt_point = {
      "26:42116901:0"
    },
    spine_state = "skill1_2",
    bullet_effect = "10039/FX_10039_skill1_1_bullet.prefab",
    bullet_hit_effect = "10039/FX_10039_skill1_1_hit.prefab",
    bullet_scale = 10000
  },
  [42316951] = {
    id = 42316951,
    hurt_point = {
      "25:42316901:0"
    },
    spine_state = "skill3"
  },
  [42116953] = {
    id = 42116953,
    hurt_point = {
      "26:42116901:0"
    },
    spine_state = "skill1_1",
    bullet_effect = "10039/FX_10039_skill1_1_bullet.prefab",
    bullet_hit_effect = "10039/FX_10039_skill1_1_hit.prefab",
    bullet_scale = 10000
  },
  [42116954] = {
    id = 42116954,
    hurt_point = {
      "26:42116901:0"
    },
    spine_state = "skill1_2",
    bullet_effect = "10039/FX_10039_skill1_1_bullet.prefab",
    bullet_hit_effect = "10039/FX_10039_skill1_1_hit.prefab",
    bullet_scale = 10000
  },
  [42316953] = {
    id = 42316953,
    hurt_point = {
      "25:42316901:0"
    },
    spine_state = "skill3"
  },
  [42400151] = {
    id = 42400151,
    hurt_point = {
      "8:42400101:0"
    },
    effect = "BattleTacticalSkills/FX_40001.prefab",
    sound = {74001001}
  },
  [42400251] = {
    id = 42400251,
    hurt_point = {
      "6:42400201:0"
    },
    effect = "BattleTacticalSkills/FX_40002.prefab",
    sound = {74001002}
  },
  [42400351] = {
    id = 42400351,
    hurt_point = {
      "8:42400301:0",
      "15:42400302:0"
    },
    effect = "BattleTacticalSkills/FX_40003.prefab",
    sound = {74001003}
  },
  [42400451] = {
    id = 42400451,
    effect = "BattleTacticalSkills/FX_40004.prefab",
    sound = {74001004}
  },
  [42400551] = {
    id = 42400551,
    effect = "BattleTacticalSkills/FX_40005.prefab",
    sound = {74001005}
  },
  [42500151] = {
    id = 42500151,
    hurt_point = {
      "25:42500101:0"
    },
    spine_state = "skill1",
    effect = "20001/FX_20001_skill1.prefab",
    remote_effect = "100:20001/FX_20001_skill1_bullet.prefab",
    hit_effect = "20001/FX_20001_skill1_hit.prefab",
    sound = {
      72000101,
      72000102,
      72000103
    }
  },
  [42500251] = {
    id = 42500251,
    hurt_point = {
      "26:42500201:72000202"
    },
    spine_state = "skill1",
    effect = "20002/FX_20002_skill1.prefab",
    remote_effect = "100:20002/FX_20002_skill1_bullet.prefab",
    hit_effect = "20002/FX_20002_skill1_hit.prefab",
    sound = {72000201}
  },
  [42500351] = {
    id = 42500351,
    hurt_point = {
      "17:42500301:72000303"
    },
    spine_state = "skill1_1",
    effect = "20003/FX_20003_skill1_1.prefab",
    remote_effect = "100:20003/FX_20003_skill1_1_bullet.prefab",
    hit_effect = "20003/FX_20003_skill1_hit.prefab",
    sound = {72000301, 72000302}
  },
  [42500352] = {
    id = 42500352,
    hurt_point = {
      "17:42500301:72000305"
    },
    spine_state = "skill1_2",
    effect = "20003/FX_20003_skill1_2.prefab",
    remote_effect = "100:20003/FX_20003_skill1_2_bullet.prefab",
    hit_effect = "20003/FX_20003_skill1_hit.prefab",
    sound = {72000304}
  },
  [42500451] = {
    id = 42500451,
    hurt_point = {
      "30:42500401:0",
      "31:42500402:0"
    },
    spine_state = "skill1",
    effect = "20004/FX_20004_skill1.prefab",
    bullet_effect = "20004/FX_20004_skill1_bullet.prefab",
    bullet_hit_effect = "20004/FX_20004_skill1_hit.prefab",
    bullet_scale = 10000,
    sound = {72000401},
    bullet_sound = {72000402},
    bullet_hit_sound = {72000403},
    bend_scale = {1, -1}
  },
  [42500551] = {
    id = 42500551,
    hurt_point = {
      "19:42500501:0"
    },
    spine_state = "skill1",
    effect = "20005/FX_20005_skill1.prefab",
    bullet_effect = "20005/FX_20005_skill1_bullet.prefab",
    bullet_hit_effect = "20005/FX_20005_skill1_hit.prefab",
    bullet_scale = 10000,
    sound = {72000501},
    bullet_sound = {72000502},
    bullet_hit_sound = {72000503},
    bend_scale = {1}
  },
  [42500651] = {
    id = 42500651,
    hurt_point = {
      "28:42500601:72000602"
    },
    spine_state = "skill1",
    effect = "20006/FX_20006_skill1.prefab",
    remote_effect = "100:20006/FX_20006_skill1_bullet.prefab",
    hit_effect = "20006/FX_20006_skill1_hit.prefab",
    sound = {72000601}
  },
  [42600651] = {
    id = 42600651,
    hurt_point = {
      "17:42600601:72000604"
    },
    spine_state = "skill2",
    effect = "20006/FX_20006_skill2.prefab",
    remote_effect = "100:20006/FX_20006_skill2_bullet.prefab",
    hit_effect = "20006/FX_20006_skill2_hit.prefab",
    sound = {72000603}
  },
  [42500751] = {
    id = 42500751,
    hurt_point = {
      "30:42500701:72000702"
    },
    spine_state = "skill1",
    effect = "20007/FX_20007_skill1.prefab",
    remote_effect = "100:20007/FX_20007_skill1_bullet.prefab",
    hit_effect = "20007/FX_20007_skill1_hit.prefab",
    sound = {72000701}
  },
  [42600751] = {
    id = 42600751,
    hurt_point = {
      "20:42600701:72000705",
      "24:42600702:72000705"
    },
    spine_state = "skill2",
    effect = "20007/FX_20007_skill2.prefab",
    remote_effect = "100:20007/FX_20007_skill2_bullet.prefab",
    hit_effect = "20007/FX_20007_skill2_hit.prefab",
    sound = {72000703, 72000704}
  },
  [42500851] = {
    id = 42500851,
    hurt_point = {
      "19:42500801:72000805"
    },
    spine_state = "skill1",
    effect = "20008/FX_20008_skill1.prefab",
    remote_effect = "100:20008/FX_20008_skill1_bullet.prefab",
    hit_effect = "20008/FX_20008_skill1_hit.prefab",
    sound = {72000804}
  },
  [42600851] = {
    id = 42600851,
    hurt_point = {
      "24:42600801:72000803"
    },
    spine_state = "skill2",
    effect = "20008/FX_20008_skill2.prefab",
    remote_effect = "100:20008/FX_20008_skill1_bullet.prefab",
    hit_effect = "20008/FX_20008_skill2_hit.prefab",
    sound = {72000801, 72000802}
  },
  [42500951] = {
    id = 42500951,
    hurt_point = {
      "37:42500901:0"
    },
    spine_state = "skill1",
    effect = "20009/FX_20009_skill1.prefab",
    bullet_effect = "20009/FX_20009_skill1_bullet.prefab",
    bullet_hit_effect = "20009/FX_20009_skill1_hit.prefab",
    bullet_scale = 10000,
    sound = {72000904},
    bullet_sound = {72000905},
    bullet_hit_sound = {72000906}
  },
  [42600951] = {
    id = 42600951,
    hurt_point = {
      "27:42600901:0"
    },
    spine_state = "skill2",
    effect = "20009/FX_20009_skill2.prefab",
    bullet_effect = "20009/FX_20009_skill2_bullet.prefab",
    bullet_hit_effect = "20009/FX_20009_skill2_hit.prefab",
    bullet_scale = 10000,
    sound = {72000901},
    bullet_sound = {72000902},
    bullet_hit_sound = {72000903}
  },
  [42501051] = {
    id = 42501051,
    hurt_point = {
      "19:42501001:0"
    },
    spine_state = "skill1",
    effect = "20010/FX_20010_skill1.prefab",
    bullet_effect = "20010/FX_20010_skill1_bullet.prefab",
    bullet_hit_effect = "20010/FX_20010_skill1_hit.prefab",
    bullet_scale = 10000,
    sound = {72001001},
    bullet_sound = {72001002},
    bullet_hit_sound = {72001003}
  },
  [42601051] = {
    id = 42601051,
    hurt_point = {
      "28:42601001:0"
    },
    spine_state = "skill2",
    effect = "20010/FX_20010_skill2.prefab",
    bullet_effect = "20010/FX_20010_skill2_bullet.prefab",
    bullet_hit_effect = "20010/FX_20010_skill2_hit.prefab",
    bullet_scale = 10000,
    sound = {72001004, 72001005},
    bullet_sound = {72001006},
    bullet_hit_sound = {72001007}
  },
  [42501151] = {
    id = 42501151,
    hurt_point = {
      "30:42501101:72001102"
    },
    spine_state = "skill1",
    effect = "20011/FX_20011_skill1.prefab",
    hit_effect = "20011/FX_20011_skill1_hit.prefab",
    sound = {72001101}
  },
  [42701151] = {
    id = 42701151,
    hurt_point = {
      "41:42701101:72001105"
    },
    spine_state = "skill3",
    effect = "20011/FX_20011_skill3.prefab",
    hit_effect = "20011/FX_20011_skill1_hit.prefab",
    effect_target = "20011/FX_20011_skill3_target.prefab",
    sound = {72001103, 72001104},
    effect_target_limit = 1,
    warning_effect = {
      "1:40:Assets/Art/Effects/Prefab/battle/FX_battle_skill_range_circle.prefab"
    }
  },
  [42501251] = {
    id = 42501251,
    hurt_point = {
      "22:42501201:72001202"
    },
    spine_state = "skill1",
    effect = "20012/FX_20012_skill1.prefab",
    remote_effect = "10:20012/FX_20012_skill1_bullet.prefab",
    hit_effect = "20012/FX_20012_skill1_hit.prefab"
  },
  [42701251] = {
    id = 42701251,
    hurt_point = {
      "39:42701201:0"
    },
    spine_state = "skill3",
    effect = "20012/FX_20012_skill3.prefab",
    effect_target = "20012/FX_20012_skill3_target.prefab",
    effect_target_limit = 1,
    warning_effect = {
      "1:38:Assets/Art/Effects/Prefab/battle/FX_battle_skill_range_circle.prefab"
    }
  },
  [42501351] = {
    id = 42501351,
    hurt_point = {
      "15:42501301:72001302"
    },
    spine_state = "skill1",
    effect = "20013/FX_20013_skill1.prefab",
    remote_effect = "100:20013/FX_20013_skill1_bullet.prefab",
    hit_effect = "20013/FX_20013_skill1_hit.prefab",
    sound = {72001301}
  },
  [42701351] = {
    id = 42701351,
    hurt_point = {
      "22:42701301:0"
    },
    spine_state = "skill3",
    effect = "20013/FX_20013_skill3.prefab",
    hit_effect = "20013/FX_20013_skill3_hit.prefab",
    sound = {72001303, 72001304},
    warning_effect = {
      "1:21:Assets/Art/Effects/Prefab/battle/FX_battle_skill_range_circle_single.prefab"
    }
  },
  [42501451] = {
    id = 42501451,
    hurt_point = {
      "39:42501401:0"
    },
    spine_state = "skill1",
    effect = "20014/FX_20014_skill1.prefab",
    bullet_effect = "20014/FX_20014_skill1_bullet.prefab",
    bullet_hit_effect = "20014/FX_20014_skill1_hit.prefab",
    bullet_scale = 10000,
    sound = {72001401, 72001402},
    bullet_hit_sound = {72001403}
  },
  [42701451] = {
    id = 42701451,
    hurt_point = {
      "42:42701401:72001406"
    },
    spine_state = "skill3",
    effect = "20014/FX_20014_skill3.prefab",
    hit_effect = "20014/FX_20014_skill3_hit.prefab",
    sound = {72001404, 72001405},
    warning_effect = {
      "1:41:Assets/Art/Effects/Prefab/battle/FX_battle_skill_range_circle_single.prefab"
    }
  },
  [42501551] = {
    id = 42501551,
    hurt_point = {
      "30:42501501:72001504"
    },
    spine_state = "skill1_1",
    effect = "20015/FX_20015_skill1_1.prefab",
    hit_effect = "20015/FX_20015_skill1_hit.prefab",
    effect_target = "20015/FX_20015_skill1_1_target.prefab",
    sound = {
      72001501,
      72001502,
      72001503
    }
  },
  [42501552] = {
    id = 42501552,
    hurt_point = {
      "30:42501501:72001508"
    },
    spine_state = "skill1_2",
    effect = "20015/FX_20015_skill1_2.prefab",
    hit_effect = "20015/FX_20015_skill1_hit.prefab",
    sound = {
      72001505,
      72001506,
      72001507
    }
  },
  [42701551] = {
    id = 42701551,
    hurt_point = {
      "30:42701501:72001512"
    },
    spine_state = "skill3",
    effect = "20015/FX_20015_skill3.prefab",
    effect_target = "20015/FX_20015_skill3_target.prefab",
    sound = {
      72001509,
      72001510,
      72001511
    },
    warning_effect = {
      "1:29:Assets/Art/Effects/Prefab/battle/FX_battle_skill_range_circle_single.prefab"
    }
  },
  [42501651] = {
    id = 42501651,
    hurt_point = {
      "24:42501601:0"
    },
    spine_state = "skill1_1",
    effect = "20016/FX_20016_skill1_1.prefab",
    effect_target = "20016/FX_20016_skill1_1_target.prefab",
    sound = {72001601, 72001602}
  },
  [42501652] = {
    id = 42501652,
    hurt_point = {
      "24:42501601:72001604"
    },
    spine_state = "skill1_2",
    effect = "20016/FX_20016_skill1_2.prefab",
    hit_effect = "20016/FX_20016_skill1_2_hit.prefab",
    sound = {72001603}
  },
  [42601651] = {
    id = 42601651,
    hurt_point = {
      "48:42601601:0"
    },
    spine_state = "skill2_1",
    effect = "20016/FX_20016_skill2_1.prefab",
    effect_target = "20016/FX_20016_skill2_1_target.prefab",
    sound = {72001605, 72001606},
    warning_effect = {
      "1:47:Assets/Art/Effects/Prefab/battle/FX_battle_skill_range_circle_single.prefab"
    }
  },
  [42601661] = {
    id = 42601661,
    hurt_point = {
      "34:42601611:0",
      "39:42601612:0"
    },
    spine_state = "skill2_2",
    effect = "20016/FX_20016_skill2_2.prefab",
    effect_target = "20016/FX_20016_skill2_2_target.prefab",
    sound = {72001607}
  },
  [42601671] = {
    id = 42601671,
    hurt_point = {
      "35:42601621:0"
    },
    spine_state = "skill2_3",
    effect = "20016/FX_20016_skill2_3.prefab",
    sound = {72001608}
  },
  [42701651] = {
    id = 42701651,
    hurt_point = {
      "55:42701601:0",
      "60:42701602:0",
      "65:42701603:0",
      "70:42701604:0",
      "75:42701605:0",
      "83:42701606:0"
    },
    spine_state = "skill3",
    effect = "20016/FX_20016_skill3.prefab",
    hit_effect = "20016/FX_20016_skill3_hit.prefab",
    sound = {72001609}
  },
  [42501751] = {
    id = 42501751,
    hurt_point = {
      "26:42501701:0"
    },
    spine_state = "skill1"
  },
  [42601751] = {
    id = 42601751,
    hurt_point = {
      "10:42601701:0"
    },
    spine_state = "skill2"
  },
  [42701751] = {
    id = 42701751,
    hurt_point = {
      "28:42701701:0"
    },
    spine_state = "skill3"
  },
  [42501851] = {
    id = 42501851,
    hurt_point = {
      "24:42501801:0"
    },
    spine_state = "skill1_1",
    effect = "20016/FX_20016_skill1_1.prefab",
    effect_target = "20016/FX_20016_skill1_1_target.prefab",
    sound = {72001801, 72001802}
  },
  [42501852] = {
    id = 42501852,
    hurt_point = {
      "24:42501801:72001804"
    },
    spine_state = "skill1_2",
    effect = "20016/FX_20016_skill1_2.prefab",
    hit_effect = "20016/FX_20016_skill1_2_hit.prefab",
    sound = {72001803}
  },
  [42601851] = {
    id = 42601851,
    hurt_point = {
      "48:42601801:0"
    },
    spine_state = "skill2_1",
    effect = "20016/FX_20016_1_skill2_1.prefab",
    effect_target = "20016/FX_20016_skill2_1_target.prefab",
    sound = {72001805, 72001806},
    warning_effect = {
      "1:47:Assets/Art/Effects/Prefab/battle/FX_battle_skill_range_circle_single.prefab"
    }
  },
  [42601861] = {
    id = 42601861,
    hurt_point = {
      "34:42601811:0",
      "39:42601812:0"
    },
    spine_state = "skill2_2",
    effect = "20016/FX_20016_skill2_2.prefab",
    effect_target = "20016/FX_20016_skill2_2_target.prefab",
    sound = {72001807}
  },
  [42601871] = {
    id = 42601871,
    hurt_point = {
      "35:42601821:0"
    },
    spine_state = "skill2_3",
    effect = "20016/FX_20016_skill2_3.prefab",
    sound = {72001808}
  },
  [42701851] = {
    id = 42701851,
    hurt_point = {
      "1:42701801:0"
    },
    spine_state = "skill3",
    effect = "20016/FX_20016_1_skill3.prefab",
    bomb_effect_target = "20016/FX_20016_1_skill3_target.prefab:20016/FX_20016_1_skill3_hit.prefab",
    sound = {72001809}
  },
  [42510151] = {
    id = 42510151,
    hurt_point = {
      "19:42510101:72010102"
    },
    spine_state = "skill1",
    effect = "20101/FX_20101_skill1.prefab",
    remote_effect = "100:20101/FX_20101_skill1_bullet.prefab",
    hit_effect = "20101/FX_20101_skill1_hit.prefab",
    sound = {72010101}
  },
  [42510251] = {
    id = 42510251,
    hurt_point = {
      "39:42510201:0"
    },
    spine_state = "skill1",
    effect = "20102/FX_20102_skill1.prefab",
    bullet_effect = "20102/FX_20102_skill1_bullet.prefab",
    bullet_hit_effect = "20102/FX_20102_skill1_hit.prefab",
    bullet_scale = 10000,
    sound = {72010201, 72010202},
    bullet_sound = {72010203},
    bullet_hit_sound = {72010204}
  },
  [42510351] = {
    id = 42510351,
    hurt_point = {
      "31:42510301:72010302"
    },
    spine_state = "skill1",
    effect = "20103/FX_20103_skill1.prefab",
    remote_effect = "100:20103/FX_20103_skill1_bullet.prefab",
    hit_effect = "20103/FX_20103_skill1_hit.prefab",
    sound = {72010301}
  },
  [42610351] = {
    id = 42610351,
    hurt_point = {
      "42:42610301:72010305"
    },
    spine_state = "skill2",
    effect = "20103/FX_20103_skill2.prefab",
    remote_effect = "100:20103/FX_20103_skill2_bullet.prefab",
    hit_effect = "20103/FX_20103_skill2_hit.prefab",
    sound = {72010303, 72010304}
  },
  [42510451] = {
    id = 42510451,
    hurt_point = {
      "22:42510401:72010402"
    },
    spine_state = "skill1",
    effect = "20104/FX_20104_skill1.prefab",
    remote_effect = "100:20104/FX_20104_skill1_bullet.prefab",
    hit_effect = "20104/FX_20104_skill1_hit.prefab",
    sound = {72010401}
  },
  [42610451] = {
    id = 42610451,
    hurt_point = {
      "35:42610401:72010405"
    },
    spine_state = "skill2",
    effect = "20104/FX_20104_skill2.prefab",
    remote_effect = "100:20104/FX_20104_skill2_bullet.prefab",
    effect_target = "20104/FX_20104_skill2_target.prefab",
    sound = {72010403, 72010404}
  },
  [42510551] = {
    id = 42510551,
    hurt_point = {
      "23:42510501:72010502"
    },
    spine_state = "skill1",
    effect = "20105/FX_20105_skill1.prefab",
    remote_effect = "10:20105/FX_20105_skill1_bullet.prefab",
    hit_effect = "20105/FX_20105_skill1_hit.prefab",
    sound = {72010501}
  },
  [42610551] = {
    id = 42610551,
    hurt_point = {
      "31:42610501:0"
    },
    spine_state = "skill2",
    effect = "20105/FX_20105_skill2.prefab",
    effect_target = "20105/FX_20105_skill2_target.prefab",
    sound = {72010503, 72010504}
  },
  [42510651] = {
    id = 42510651,
    hurt_point = {
      "17:42510601:0"
    },
    spine_state = "skill1",
    effect = "20106/FX_20106_skill1.prefab",
    bullet_effect = "20106/FX_20106_skill1_bullet.prefab",
    bullet_hit_effect = "20106/FX_20106_skill1_hit.prefab",
    bullet_scale = 10000,
    sound = {72010605},
    bullet_sound = {72010606},
    bullet_hit_sound = {72010607}
  },
  [42610651] = {
    id = 42610651,
    hurt_point = {
      "33:42610601:0",
      "43:42610602:0"
    },
    spine_state = "skill2",
    effect = "20106/FX_20106_skill2.prefab",
    bullet_effect = "20106/FX_20106_skill1_bullet.prefab",
    bullet_hit_effect = "20106/FX_20106_skill1_hit.prefab",
    bullet_scale = 10000,
    sound = {72010601, 72010602},
    bullet_sound = {72010603},
    bullet_hit_sound = {72010604},
    bend_scale = {1, 2.8}
  },
  [42510751] = {
    id = 42510751,
    hurt_point = {
      "23:42510701:0"
    },
    spine_state = "skill1",
    effect = "20107/FX_20107_skill1.prefab",
    bullet_effect = "20107/FX_20107_skill1_bullet.prefab",
    bullet_hit_effect = "20107/FX_20107_skill1_hit.prefab",
    bullet_scale = 10000,
    sound = {72010701},
    bullet_sound = {72010702},
    bullet_hit_sound = {72010703}
  },
  [42610751] = {
    id = 42610751,
    hurt_point = {
      "39:42610701:0"
    },
    spine_state = "skill2",
    effect = "20107/FX_20107_skill2.prefab",
    bullet_effect = "20107/FX_20107_skill2_bullet.prefab",
    bullet_hit_effect = "20107/FX_20107_skill2_hit.prefab",
    bullet_scale = 10000,
    sound = {72010704, 72010705},
    bullet_sound = {72010706},
    bullet_hit_sound = {72010707}
  },
  [42510851] = {
    id = 42510851,
    hurt_point = {
      "18:42510801:72010802"
    },
    spine_state = "skill1",
    effect = "20108/FX_20108_skill1.prefab",
    hit_effect = "20108/FX_20108_skill1_hit.prefab",
    sound = {72010801}
  },
  [42710851] = {
    id = 42710851,
    hurt_point = {
      "34:42710801:0"
    },
    spine_state = "skill3",
    effect = "20108/FX_20108_skill3.prefab",
    effect_target = "20108/FX_20108_skill3_target.prefab",
    sound = {
      72010803,
      72010804,
      72010805
    },
    warning_effect = {
      "1:33:Assets/Art/Effects/Prefab/battle/FX_battle_skill_range_circle.prefab"
    }
  },
  [42510951] = {
    id = 42510951,
    hurt_point = {
      "26:42510901:0"
    },
    spine_state = "skill1"
  },
  [42710951] = {
    id = 42710951,
    hurt_point = {
      "24:42710901:0"
    },
    spine_state = "skill3",
    warning_effect = {
      "1:23:Assets/Art/Effects/Prefab/battle/FX_battle_skill_range_circle.prefab"
    }
  },
  [42511051] = {
    id = 42511051,
    hurt_point = {
      "25:42511001:0"
    },
    spine_state = "skill1",
    effect = "20110/FX_20110_skill1.prefab",
    effect_target = "20110/FX_20110_skill1_target.prefab",
    sound = {72011001, 72011002}
  },
  [42611051] = {
    id = 42611051,
    hurt_point = {
      "33:42611001:72011004"
    },
    spine_state = "skill2",
    effect = "20110/FX_20110_skill2.prefab",
    remote_effect = "10:20110/FX_20110_skill2_bullet.prefab",
    hit_effect = "20110/FX_20110_skill2_hit.prefab",
    sound = {72011003}
  },
  [42511151] = {
    id = 42511151,
    hurt_point = {
      "20:42511101:0"
    },
    spine_state = "skill1",
    effect = "20111/FX_20111_skill1.prefab",
    bullet_effect = "20111/FX_20111_skill1_bullet.prefab",
    bullet_hit_effect = "20111/FX_20111_skill1_hit.prefab",
    bullet_scale = 10000,
    sound = {72011101, 72011102},
    bullet_sound = {72011103},
    bullet_hit_sound = {72011104},
    bend_scale = {1}
  },
  [42611151] = {
    id = 42611151,
    hurt_point = {
      "37:42611101:0"
    },
    spine_state = "skill2",
    effect = "20111/FX_20111_skill2.prefab",
    effect_target = "20111/FX_20111_skill2_target.prefab",
    sound = {72011105, 72011106}
  },
  [42511251] = {
    id = 42511251,
    hurt_point = {
      "24:42511201:0"
    },
    spine_state = "skill1",
    effect = "20112/FX_20112_skill1.prefab",
    bullet_effect = "20112/FX_20112_skill1_bullet.prefab",
    bullet_hit_effect = "20112/FX_20112_skill1_hit.prefab",
    bullet_scale = 10000,
    sound = {72011201},
    bullet_sound = {72011202},
    bullet_hit_sound = {72011203},
    bend_scale = {1}
  },
  [42711251] = {
    id = 42711251,
    hurt_point = {
      "31:42711201:0"
    },
    spine_state = "skill3",
    effect = "20112/FX_20112_skill3.prefab",
    bullet_effect = "20112/FX_20112_skill3_bullet.prefab",
    bullet_hit_effect = "20112/FX_20112_skill3_hit.prefab",
    bullet_scale = 10000,
    sound = {
      72011204,
      72011205,
      72011206
    },
    bullet_sound = {72011207},
    bullet_hit_sound = {72011208},
    bend_scale = {1},
    warning_effect = {
      "1:30:Assets/Art/Effects/Prefab/battle/FX_battle_skill_range_circle_single.prefab"
    }
  },
  [42511351] = {
    id = 42511351,
    hurt_point = {
      "28:42511301:0"
    },
    spine_state = "skill1",
    bullet_effect = "10007/FX_10007_skill1_bullet.prefab",
    bullet_hit_effect = "10007/FX_10007_skill1_hit.prefab",
    bullet_scale = 10000,
    bend_scale = {1}
  },
  [42611351] = {
    id = 42611351,
    hurt_point = {
      "28:42611301:0"
    },
    spine_state = "skill2",
    bullet_effect = "10007/FX_10007_skill1_bullet.prefab",
    bullet_hit_effect = "10007/FX_10007_skill1_hit.prefab",
    bullet_scale = 10000,
    bend_scale = {1}
  },
  [42711351] = {
    id = 42711351,
    hurt_point = {
      "34:42711301:0"
    },
    spine_state = "skill3",
    bullet_effect = "10007/FX_10007_skill1_bullet.prefab",
    bullet_hit_effect = "10007/FX_10007_skill1_hit.prefab",
    bullet_scale = 10000,
    bend_scale = {1}
  },
  [42511451] = {
    id = 42511451,
    hurt_point = {
      "34:42511401:72011403"
    },
    spine_state = "skill1",
    effect = "20114/FX_20114_skill1.prefab",
    hit_effect = "20114/FX_20114_skill1_hit.prefab",
    sound = {72011401, 72011402},
    end_points = {"hit"}
  },
  [42611451] = {
    id = 42611451,
    hurt_point = {
      "36:42611401:0",
      "48:42611402:0",
      "60:42611403:0"
    },
    spine_state = "skill2",
    effect = "20114/FX_20114_skill2.prefab",
    bullet_effect = "20114/FX_20114_skill2_bullet.prefab",
    bullet_hit_effect = "20114/FX_20114_skill2_hit.prefab",
    bullet_scale = 10000,
    sound = {72011404},
    bullet_sound = {72011405},
    bullet_hit_sound = {72011406},
    bend_scale = {
      2,
      -2,
      2
    },
    start_points = {
      "bullet_2",
      "bullet_2",
      "bullet_2"
    }
  },
  [42711451] = {
    id = 42711451,
    hurt_point = {
      "31:42711401:0",
      "42:42711402:0"
    },
    spine_state = "skill3",
    effect = "20114/FX_20114_skill3.prefab",
    sound = {72011407, 72011408}
  },
  [42511551] = {
    id = 42511551,
    hurt_point = {
      "29:42511501:72011504"
    },
    spine_state = "skill1",
    effect = "20115/FX_20115_skill1.prefab",
    hit_effect = "20115/FX_20115_skill1_hit.prefab",
    sound = {
      72011501,
      72011502,
      72011503
    }
  },
  [42611551] = {
    id = 42611551,
    hurt_point = {
      "40:42611501:72011507"
    },
    spine_state = "skill2_1",
    effect = "20115/FX_20115_skill2_1.prefab",
    effect_target = "20115/FX_20115_skill2_1_target.prefab",
    sound = {
      72011505,
      72011506,
      72011508
    }
  },
  [42611561] = {
    id = 42611561,
    hurt_point = {
      "74:42611511:0"
    },
    spine_state = "skill2_2",
    effect = "20115/FX_20115_skill2_2.prefab",
    hit_effect = "20115/FX_20115_skill2_2_hit.prefab"
  },
  [42611571] = {
    id = 42611571,
    hurt_point = {
      "53:42611521:0"
    },
    spine_state = "skill2_3",
    effect = "20115/FX_20115_skill2_3.prefab"
  },
  [42711551] = {
    id = 42711551,
    hurt_point = {
      "49:42711501:0",
      "55:42711502:0",
      "59:42711503:0"
    },
    spine_state = "skill3",
    effect = "20115/FX_20115_skill3.prefab",
    hit_effect = "20115/FX_20115_skill3_hit.prefab",
    bullet_effect = "20115/FX_20115_skill3_bullet.prefab",
    bullet_hit_effect = "20115/FX_20115_skill3_hit.prefab",
    bullet_scale = 10000,
    sound = {
      72011509,
      72011510,
      72011511
    },
    bend_scale = {
      1,
      2,
      -2
    },
    warning_effect = {
      "1:48:Assets/Art/Effects/Prefab/battle/FX_battle_skill_range_circle_single.prefab"
    }
  },
  [42511751] = {
    id = 42511751,
    hurt_point = {
      "29:42511701:72011703"
    },
    spine_state = "skill1",
    effect = "20117/FX_20117_skill1.prefab",
    hit_effect = "20117/FX_20117_skill1_hit.prefab",
    sound = {
      72011701,
      72011702,
      72011704
    }
  },
  [42611751] = {
    id = 42611751,
    hurt_point = {
      "40:42611701:72011706"
    },
    spine_state = "skill2_1",
    effect = "20117/FX_20117_skill2_1.prefab",
    effect_target = "20117/FX_20117_skill2_1_target.prefab",
    sound = {72011705, 72011707}
  },
  [42611761] = {
    id = 42611761,
    hurt_point = {
      "31:42611711:0"
    },
    spine_state = "skill2_2",
    effect = "20117/FX_20117_skill2_2.prefab",
    hit_effect = "20117/FX_20117_skill2_2_hit.prefab"
  },
  [42611771] = {
    id = 42611771,
    hurt_point = {
      "40:42611721:0"
    },
    spine_state = "skill2_3",
    effect = "20117/FX_20117_skill2_3.prefab",
    effect_target_limit = 1
  },
  [42711751] = {
    id = 42711751,
    hurt_point = {
      "49:42711701:72011711",
      "55:42711702:72011711",
      "59:42711703:72011711",
      "63:42711704:72011711",
      "67:42711705:72011711",
      "73:42711706:72011711",
      "78:42711707:72011711"
    },
    spine_state = "skill3",
    effect = "20117/FX_20117_skill3.prefab",
    hit_effect = "20117/FX_20117_skill3_hit.prefab",
    sound = {
      72011708,
      72011709,
      72011710
    },
    warning_effect = {
      "1:48:Assets/Art/Effects/Prefab/battle/FX_battle_skill_range_circle.prefab"
    }
  },
  [42511851] = {
    id = 42511851,
    hurt_point = {
      "34:42511801:72011803"
    },
    spine_state = "skill1",
    effect = "20114/FX_20114_skill1.prefab",
    hit_effect = "20114/FX_20114_skill1_hit.prefab",
    sound = {72011801, 72011802},
    end_points = {"hit"}
  },
  [42611851] = {
    id = 42611851,
    hurt_point = {
      "36:42611801:0",
      "48:42611802:0",
      "60:42611803:0"
    },
    spine_state = "skill2",
    effect = "20114/FX_20114_skill2.prefab",
    bullet_effect = "20114/FX_20114_skill2_bullet.prefab",
    bullet_hit_effect = "20114/FX_20114_skill2_hit.prefab",
    bullet_scale = 10000,
    sound = {72011804},
    bullet_sound = {72011805},
    bullet_hit_sound = {72011806},
    bend_scale = {
      2,
      -2,
      2
    },
    start_points = {
      "bullet_2",
      "bullet_2",
      "bullet_2"
    }
  },
  [42711851] = {
    id = 42711851,
    hurt_point = {
      "31:42711801:0",
      "42:42711802:0"
    },
    spine_state = "skill3",
    effect = "20114/FX_20114_1_skill3.prefab",
    bomb_effect_target = "20114/FX_20114_1_skill3_target.prefab:20114/FX_20114_1_skill3_hit.prefab",
    sound = {72011807}
  },
  [42520151] = {
    id = 42520151,
    hurt_point = {
      "23:42520101:0"
    },
    spine_state = "skill1",
    effect = "20201/FX_20201_skill1.prefab",
    bullet_effect = "20201/FX_20201_skill1_bullet.prefab",
    bullet_hit_effect = "20201/FX_20201_skill1_hit.prefab",
    bullet_scale = 10000,
    sound = {72020101, 72020102},
    bullet_sound = {72020103},
    bullet_hit_sound = {72020104},
    bend_scale = {1}
  },
  [42520251] = {
    id = 42520251,
    hurt_point = {
      "32:42520201:0"
    },
    spine_state = "skill1",
    effect = "20202/FX_20202_skill1.prefab",
    bullet_effect = "20202/FX_20202_skill1_bullet.prefab",
    bullet_hit_effect = "20202/FX_20202_skill1_hit.prefab",
    bullet_scale = 10000,
    sound = {72020201, 72020202},
    bullet_sound = {72020203},
    bullet_hit_sound = {72020204},
    bend_scale = {1}
  },
  [42520351] = {
    id = 42520351,
    hurt_point = {
      "19:42520301:0"
    },
    spine_state = "skill1",
    effect = "20203/FX_20203_skill1.prefab",
    remote_effect = "100:20203/FX_20203_skill1_bullet.prefab",
    hit_effect = "20203/FX_20203_skill1_hit.prefab",
    sound = {72020301}
  },
  [42620351] = {
    id = 42620351,
    hurt_point = {
      "19:42620301:72020304"
    },
    spine_state = "skill2",
    effect = "20203/FX_20203_skill2.prefab",
    remote_effect = "50:20203/FX_20203_skill1_bullet.prefab",
    hit_effect = "20203/FX_20203_skill2_hit.prefab",
    sound = {72020302, 72020303}
  },
  [42520451] = {
    id = 42520451,
    hurt_point = {
      "24:42520401:72020404"
    },
    spine_state = "skill1",
    effect = "20204/FX_20204_skill1.prefab",
    remote_effect = "100:20204/FX_20204_skill1_bullet.prefab",
    hit_effect = "20204/FX_20204_skill1_hit.prefab",
    sound = {72020403}
  },
  [42620451] = {
    id = 42620451,
    hurt_point = {
      "15:42620401:72020402"
    },
    spine_state = "skill2",
    effect = "20204/FX_20204_skill2.prefab",
    remote_effect = "100:20204/FX_20204_skill2_bullet.prefab",
    hit_effect = "20204/FX_20204_skill2_hit.prefab",
    sound = {72020401}
  },
  [42520551] = {
    id = 42520551,
    hurt_point = {
      "21:42520501:0"
    },
    spine_state = "skill1",
    effect = "20205/FX_20205_skill1.prefab",
    bullet_effect = "20205/FX_20205_skill1_bullet.prefab",
    bullet_hit_effect = "20205/FX_20205_skill1_hit.prefab",
    bullet_scale = 10000,
    sound = {72020501},
    bullet_sound = {72020502},
    bullet_hit_sound = {72020503},
    bend_scale = {1}
  },
  [42620551] = {
    id = 42620551,
    hurt_point = {
      "6:42620501:0",
      "20:42620502:0"
    },
    spine_state = "skill2",
    effect = "20205/FX_20205_skill2.prefab",
    bullet_effect = "20205/FX_20205_skill2_bullet.prefab",
    bullet_hit_effect = "20205/FX_20205_skill2_hit.prefab",
    bullet_scale = 10000,
    sound = {72020504, 72020505},
    bullet_sound = {72020506},
    bullet_hit_sound = {72020507},
    bend_scale = {1}
  },
  [42520651] = {
    id = 42520651,
    hurt_point = {
      "26:42520601:0"
    },
    spine_state = "skill1",
    effect = "20206/FX_20206_skill1.prefab",
    bullet_effect = "20206/FX_20206_skill1_bullet.prefab",
    bullet_hit_effect = "20206/FX_20206_skill1_hit.prefab",
    bullet_scale = 10000,
    sound = {72020601},
    bullet_sound = {72020602},
    bullet_hit_sound = {72020603},
    bend_scale = {1}
  },
  [42620651] = {
    id = 42620651,
    hurt_point = {
      "30:42620601:0"
    },
    spine_state = "skill2",
    effect = "20206/FX_20206_skill2.prefab",
    bullet_effect = "20206/FX_20206_skill2_bullet.prefab",
    bullet_hit_effect = "20206/FX_20206_skill2_hit.prefab",
    bullet_scale = 10000,
    sound = {72020604, 72020605},
    bullet_sound = {72020606},
    bullet_hit_sound = {72020607}
  },
  [42520751] = {
    id = 42520751,
    hurt_point = {
      "29:42520701:0"
    },
    spine_state = "skill1",
    effect = "20207/FX_20207_skill1.prefab",
    remote_effect = "100:20207/FX_20207_skill1_bullet.prefab",
    hit_effect = "20207/FX_20207_skill1_hit.prefab",
    sound = {72020703, 72020704}
  },
  [42620751] = {
    id = 42620751,
    hurt_point = {
      "34:42620701:0"
    },
    spine_state = "skill2",
    effect = "20207/FX_20207_skill2.prefab",
    remote_effect = "100:20207/FX_20207_skill2_bullet.prefab",
    effect_target = "20207/FX_20207_skill2_target.prefab",
    sound = {72020701, 72020702}
  },
  [42520851] = {
    id = 42520851,
    hurt_point = {
      "18:42520801:72020802"
    },
    spine_state = "skill1",
    effect = "20208/FX_20208_skill1.prefab",
    remote_effect = "100:20208/FX_20208_skill1_bullet.prefab",
    hit_effect = "20208/FX_20208_skill1_hit.prefab",
    sound = {72020801}
  },
  [42620851] = {
    id = 42620851,
    hurt_point = {
      "18:42620801:72020805"
    },
    spine_state = "skill2",
    effect = "20208/FX_20208_skill2.prefab",
    hit_effect = "20208/FX_20208_skill2_hit.prefab",
    effect_target = "20208/FX_20208_skill2_target.prefab",
    sound = {72020803, 72020804}
  },
  [42520951] = {
    id = 42520951,
    hurt_point = {
      "15:42520901:72020902"
    },
    spine_state = "skill1",
    effect = "20209/FX_20209_skill1.prefab",
    hit_effect = "20209/FX_20209_skill1_hit.prefab",
    sound = {72020901}
  },
  [42720951] = {
    id = 42720951,
    hurt_point = {
      "31:42720901:72020904"
    },
    spine_state = "skill3",
    effect = "20209/FX_20209_skill3.prefab",
    effect_target = "20209/FX_20209_skill3_target.prefab",
    sound = {72020903},
    warning_effect = {
      "1:30:Assets/Art/Effects/Prefab/battle/FX_battle_skill_range_circle_single.prefab"
    }
  },
  [42521051] = {
    id = 42521051,
    hurt_point = {
      "26:42521001:72021002"
    },
    spine_state = "skill1",
    effect = "20210/FX_20210_skill1.prefab",
    hit_effect = "20210/FX_20210_skill1_hit.prefab",
    sound = {72021001},
    start_points = {"eye"},
    end_points = {"hit"}
  },
  [42721051] = {
    id = 42721051,
    hurt_point = {
      "35:42721001:72021005"
    },
    spine_state = "skill3",
    effect = "20210/FX_20210_skill3.prefab",
    effect_target = "20210/FX_20210_skill3_target.prefab",
    sound_target = {72021004},
    sound = {72021003},
    effect_target_limit = 1,
    warning_effect = {
      "1:34:Assets/Art/Effects/Prefab/battle/FX_battle_skill_range_circle.prefab"
    }
  },
  [42521151] = {
    id = 42521151,
    hurt_point = {
      "24:42521101:0"
    },
    spine_state = "skill1",
    effect = "20211/FX_20211_skill1.prefab",
    bullet_effect = "20211/FX_20211_skill1_bullet.prefab",
    bullet_hit_effect = "20211/FX_20211_skill1_hit.prefab",
    bullet_scale = 10000,
    sound = {72021101},
    bullet_hit_sound = {72021102},
    bend_scale = {1}
  },
  [42721151] = {
    id = 42721151,
    hurt_point = {
      "29:42721101:0"
    },
    spine_state = "skill3",
    effect = "20211/FX_20211_skill3.prefab",
    bullet_effect = "20211/FX_20211_skill3_bullet.prefab",
    bullet_hit_effect = "20211/FX_20211_skill3_hit.prefab",
    bullet_scale = 10000,
    sound = {72021103, 72021104},
    bullet_hit_sound = {72021105},
    bend_scale = {1},
    warning_effect = {
      "1:28:Assets/Art/Effects/Prefab/battle/FX_battle_skill_range_circle_single.prefab"
    }
  },
  [42521251] = {
    id = 42521251,
    hurt_point = {
      "24:42521201:0"
    },
    spine_state = "skill1"
  },
  [42621251] = {
    id = 42621251,
    hurt_point = {
      "49:42621201:0"
    },
    spine_state = "skill2"
  },
  [42721251] = {
    id = 42721251,
    hurt_point = {
      "52:42721201:0"
    },
    spine_state = "skill3"
  },
  [42921251] = {id = 42921251, spine_state = "skillex1"},
  [42521451] = {
    id = 42521451,
    hurt_point = {
      "21:42521401:0"
    },
    spine_state = "skill1",
    effect = "20214/FX_20214_skill1.prefab",
    bullet_effect = "20214/FX_20214_skill1_bullet.prefab",
    bullet_hit_effect = "20214/FX_20214_skill1_hit.prefab",
    bullet_scale = 10000
  },
  [42621451] = {
    id = 42621451,
    hurt_point = {
      "26:42621401:0"
    },
    spine_state = "skill2_1",
    effect = "20214/FX_20214_skill2_1.prefab",
    hit_effect = "20214/FX_20214_skill2_1_hit.prefab"
  },
  [42621461] = {
    id = 42621461,
    hurt_point = {
      "25:42621411:0"
    },
    spine_state = "skill2_2",
    effect = "20214/FX_20214_skill2_2.prefab",
    bullet_effect = "20214/FX_20214_skill2_2_bullet.prefab",
    bullet_hit_effect = "20214/FX_20214_skill2_2_hit_02.prefab",
    bullet_scale = 10000
  },
  [42621471] = {
    id = 42621471,
    hurt_point = {
      "33:42621421:0"
    },
    spine_state = "skill2_3",
    effect = "20214/FX_20214_skill2_3.prefab"
  },
  [42721451] = {
    id = 42721451,
    hurt_point = {
      "55:42721401:0"
    },
    spine_state = "skill3",
    effect = "20214/FX_20214_skill3.prefab",
    effect_target = "20214/FX_20214_skill3_target.prefab",
    warning_effect = {
      "1:54:Assets/Art/Effects/Prefab/battle/FX_battle_skill_range_circle_single.prefab"
    }
  },
  [42721456] = {
    id = 42721456,
    hurt_point = {
      "1:42721410:0"
    },
    bullet_effect = "20214/FX_20214_skill3_buff_bullet.prefab",
    bullet_hit_effect = "20214/FX_20214_skill3_buff_hit.prefab",
    bullet_scale = 5000,
    bullet_speed = 1050
  },
  [42521651] = {
    id = 42521651,
    hurt_point = {
      "22:42521601:0"
    },
    spine_state = "skill1",
    effect = "20216/FX_20216_skill1.prefab",
    bullet_effect = "20216/FX_20216_skill1_bullet.prefab",
    bullet_hit_effect = "20216/FX_20216_skill1_hit.prefab",
    bullet_scale = 10000,
    bend_scale = {1}
  },
  [42621651] = {
    id = 42621651,
    hurt_point = {
      "22:42621601:0"
    },
    spine_state = "skill2_1",
    effect = "20216/FX_20216_skill2_1.prefab",
    bullet_effect = "20216/FX_20216_skill2_1_bullet.prefab",
    bullet_hit_effect = "20216/FX_20216_skill2_1_hit.prefab",
    bullet_scale = 10000,
    bend_scale = {1},
    start_points = {"bullet_2"}
  },
  [42621661] = {
    id = 42621661,
    hurt_point = {
      "27:42621611:0"
    },
    spine_state = "skill2_2",
    effect = "20216/FX_20216_skill2_2.prefab",
    effect_line_underfoot = "20216/FX_20216_skill2_2_line.prefab",
    effect_target = "20216/FX_20216_skill2_2_target.prefab"
  },
  [42621671] = {
    id = 42621671,
    hurt_point = {
      "34:42621621:0"
    },
    spine_state = "skill2_3",
    effect = "20216/FX_20216_skill2_3.prefab",
    effect_line_underfoot = "20216/FX_20216_skill2_3_hit_line.prefab",
    start_points = {"hit"}
  },
  [42721651] = {
    id = 42721651,
    hurt_point = {
      "55:42721601:0",
      "57:42721602:0",
      "60:42721603:0",
      "64:42721604:0",
      "68:42721605:0",
      "72:42721606:0"
    },
    spine_state = "skill3",
    effect = "20216/FX_20216_skill3.prefab",
    hit_effect_list = {
      "20216/FX_20216_skill3_hit.prefab",
      "20216/FX_20216_skill3_hit.prefab",
      "20216/FX_20216_skill3_hit.prefab",
      "20216/FX_20216_skill3_hit.prefab",
      "20216/FX_20216_skill3_hit.prefab",
      "20216/FX_20216_skill3_hit_02.prefab"
    },
    warning_effect = {
      "1:54:Assets/Art/Effects/Prefab/battle/FX_battle_skill_range_circle_single.prefab"
    }
  },
  [42530151] = {
    id = 42530151,
    hurt_point = {
      "23:42530101:72030102"
    },
    spine_state = "skill1",
    effect = "20301/FX_20301_skill1.prefab",
    remote_effect = "100:20301/FX_20301_skill1_bullet.prefab",
    hit_effect = "20301/FX_20301_skill1_hit.prefab",
    sound = {72030101}
  },
  [42530251] = {
    id = 42530251,
    hurt_point = {
      "18:42530201:72030205",
      "26:42530202:72030202"
    },
    spine_state = "skill1",
    effect = "20302/FX_20302_skill1.prefab",
    remote_effect = "100:20302/FX_20302_skill1_bullet.prefab",
    hit_effect = "20302/FX_20302_skill1_hit.prefab",
    bullet_effect = "10007/FX_10007_skill1_bullet.prefab",
    bullet_hit_effect = "10007/FX_10007_skill1_hit.prefab",
    bullet_scale = 10000,
    sound = {72030203, 72030204}
  },
  [42530351] = {
    id = 42530351,
    hurt_point = {
      "14:42530301:72030302"
    },
    spine_state = "skill1",
    effect = "20303/FX_20303_skill1.prefab",
    remote_effect = "100:20303/FX_20303_skill1_bullet.prefab",
    hit_effect = "20303/FX_20303_skill1_hit.prefab",
    sound = {72030301}
  },
  [42630351] = {
    id = 42630351,
    hurt_point = {
      "15:42630301:72030304"
    },
    spine_state = "skill2",
    effect = "20303/FX_20303_skill2.prefab",
    hit_effect = "20303/FX_20303_skill2_hit.prefab",
    effect_target = "20303/FX_20303_skill2_target.prefab",
    sound = {72030303}
  },
  [42530451] = {
    id = 42530451,
    hurt_point = {
      "18:42530401:72030402"
    },
    spine_state = "skill1",
    effect = "20304/FX_20304_skill1.prefab",
    remote_effect = "10:20304/FX_20304_skill1_bullet.prefab",
    hit_effect = "20304/FX_20304_skill1_hit.prefab",
    sound = {72030401}
  },
  [42630451] = {
    id = 42630451,
    hurt_point = {
      "37:42630401:72030404"
    },
    spine_state = "skill2",
    effect = "20304/FX_20304_skill2.prefab",
    remote_effect = "10:20304/FX_20304_skill2_bullet.prefab",
    hit_effect = "20304/FX_20304_skill2_hit.prefab",
    sound = {72030403}
  },
  [42530551] = {
    id = 42530551,
    hurt_point = {
      "24:42530501:72030502"
    },
    spine_state = "skill1",
    effect = "20305/FX_20305_skill1.prefab",
    remote_effect = "100:20305/FX_20305_skill1_bullet.prefab",
    hit_effect = "20305/FX_20305_skill1_hit.prefab",
    sound = {72030501}
  },
  [42630551] = {
    id = 42630551,
    hurt_point = {
      "24:42630501:72030505",
      "28:42630502:72030505"
    },
    spine_state = "skill2",
    effect = "20305/FX_20305_skill2.prefab",
    remote_effect = "100:20305/FX_20305_skill2_bullet.prefab",
    hit_effect = "20305/FX_20305_skill2_hit.prefab",
    sound = {72030503, 72030504}
  },
  [42530651] = {
    id = 42530651,
    hurt_point = {
      "26:42530601:0"
    },
    spine_state = "skill1",
    effect = "20306/FX_20306_skill1.prefab",
    bullet_effect = "20306/FX_20306_skill1_bullet.prefab",
    bullet_hit_effect = "20306/FX_20306_skill1_hit.prefab",
    bullet_scale = 10000,
    sound = {72030601},
    bullet_sound = {72030602},
    bullet_hit_sound = {72030603}
  },
  [42630651] = {
    id = 42630651,
    hurt_point = {
      "33:42630601:0"
    },
    spine_state = "skill2",
    effect = "20306/FX_20306_skill2.prefab",
    effect_target = "20306/FX_20306_skill2_target.prefab",
    sound = {
      72030604,
      72030605,
      72030606
    }
  },
  [42530751] = {
    id = 42530751,
    hurt_point = {
      "20:42530701:0"
    },
    spine_state = "skill1",
    effect = "20307/FX_20307_skill1.prefab",
    remote_effect = "100:20307/FX_20307_skill1_bullet.prefab",
    effect_target = "20307/FX_20307_skill1_target.prefab",
    sound = {72030701, 72030702}
  },
  [42730751] = {
    id = 42730751,
    hurt_point = {
      "31:42730701:72030705"
    },
    spine_state = "skill3",
    effect = "20307/FX_20307_skill3.prefab",
    remote_effect = "100:20307/FX_20307_skill3_line.prefab",
    effect_target = "20307/FX_20307_skill3_target.prefab",
    sound = {72030703, 72030704},
    warning_effect = {
      "1:30:Assets/Art/Effects/Prefab/battle/FX_battle_skill_range_circle_single.prefab"
    }
  },
  [42530851] = {
    id = 42530851,
    hurt_point = {
      "29:42530801:0"
    },
    spine_state = "skill1",
    effect = "20308/FX_20308_skill1.prefab",
    effect_target = "20308/FX_20308_skill1_target.prefab",
    sound = {72030801}
  },
  [42730851] = {
    id = 42730851,
    hurt_point = {
      "37:42730801:72030803"
    },
    spine_state = "skill3",
    effect = "20308/FX_20308_skill3.prefab",
    effect_target = "20308/FX_20308_skill3_target.prefab",
    sound = {72030802},
    warning_effect = {
      "1:36:Assets/Art/Effects/Prefab/battle/FX_battle_skill_range_circle_single.prefab"
    }
  },
  [42530951] = {
    id = 42530951,
    hurt_point = {
      "19:42530901:72030902"
    },
    spine_state = "skill1",
    effect = "20309/FX_20309_skill1.prefab",
    effect_target = "20309/FX_20309_skill1_target.prefab",
    sound = {72030901}
  },
  [42630951] = {
    id = 42630951,
    hurt_point = {
      "13:42630901:0",
      "14:42630902:0",
      "16:42630903:0"
    },
    spine_state = "skill2",
    effect = "20309/FX_20309_skill2.prefab",
    hit_effect = "20309/FX_20309_skill2_hit.prefab",
    sound = {72030903}
  },
  [42531051] = {
    id = 42531051,
    hurt_point = {
      "31:42531001:0"
    },
    spine_state = "skill1",
    effect = "20310/FX_20310_skill1.prefab",
    hit_effect = "20310/FX_20310_skill1_hit.prefab",
    sound = {72031001},
    start_points = {"bullet_1"},
    end_points = {"hit"}
  },
  [42731051] = {
    id = 42731051,
    hurt_point = {
      "43:42731001:0"
    },
    spine_state = "skill3",
    effect = "20310/FX_20310_skill3.prefab",
    sound = {72031002}
  },
  [42531151] = {
    id = 42531151,
    hurt_point = {
      "23:42531101:0"
    },
    spine_state = "skill1",
    effect = "20311/FX_20311_skill1.prefab",
    bullet_effect = "20311/FX_20311_skill1_bullet.prefab",
    bullet_hit_effect = "20311/FX_20311_skill1_hit.prefab",
    bullet_scale = 10000,
    sound = {72031101},
    bullet_sound = {72031102},
    bullet_hit_sound = {72031103},
    bend_scale = {1}
  },
  [42631151] = {
    id = 42631151,
    hurt_point = {
      "23:42631101:0"
    },
    spine_state = "skill2",
    effect = "20311/FX_20311_skill2.prefab",
    bullet_effect = "20311/FX_20311_skill2_bullet.prefab",
    bullet_hit_effect = "20311/FX_20311_skill2_hit.prefab",
    bullet_scale = 10000,
    sound = {72031104, 72031105},
    bullet_sound = {72031106},
    bullet_hit_sound = {72031107},
    bend_scale = {1}
  },
  [42531251] = {
    id = 42531251,
    hurt_point = {
      "27:42531201:72031203"
    },
    spine_state = "skill1_1",
    effect = "20312/FX_20312_skill1_1.prefab",
    hit_effect = "20312/FX_20312_skill1_1_hit.prefab",
    sound = {72031201, 72031202}
  },
  [42531252] = {
    id = 42531252,
    hurt_point = {
      "27:42531201:72031206"
    },
    spine_state = "skill1_2",
    effect = "20312/FX_20312_skill1_2.prefab",
    hit_effect = "20312/FX_20312_skill1_1_hit.prefab",
    sound = {72031204, 72031205}
  },
  [42631251] = {
    id = 42631251,
    hurt_point = {
      "17:42631201:72031210",
      "29:42631202:72031210"
    },
    spine_state = "skill2",
    effect = "20312/FX_20312_skill2.prefab",
    effect_target = "20312/FX_20312_skill2_target.prefab",
    sound = {
      72031207,
      72031208,
      72031209
    }
  },
  [42731251] = {
    id = 42731251,
    hurt_point = {
      "30:42731201:0",
      "47:42731202:0"
    },
    spine_state = "skill3",
    effect = "20312/FX_20312_skill3.prefab",
    bullet_effect = "20312/FX_20312_skill3_bullet.prefab",
    bullet_hit_effect = "20312/FX_20312_skill3_hit.prefab",
    bullet_scale = 10000,
    sound = {
      72031211,
      72031212,
      72031213,
      72031214
    },
    bullet_hit_sound = {72031215},
    bend_scale = {1, 1}
  },
  [42531551] = {
    id = 42531551,
    hurt_point = {
      "23:42531501:72031502"
    },
    spine_state = "skill1",
    effect = "20315/FX_20315_skill1.prefab",
    hit_effect = "20315/FX_20315_skill1_hit.prefab",
    sound = {72031501, 72031503}
  },
  [42631551] = {
    id = 42631551,
    hurt_point = {
      "21:42631501:72031506"
    },
    spine_state = "skill2_1",
    effect = "20315/FX_20315_skill2_1.prefab",
    effect_target = "20315/FX_20315_skill2_1_target.prefab",
    sound = {
      72031504,
      72031505,
      72031507
    }
  },
  [42631561] = {
    id = 42631561,
    hurt_point = {
      "29:42631511:0"
    },
    spine_state = "skill2_2",
    effect = "20315/FX_20315_skill2_2.prefab",
    effect_target = "20315/FX_20315_skill2_2_target.prefab"
  },
  [42631571] = {
    id = 42631571,
    hurt_point = {
      "31:42631521:0"
    },
    spine_state = "skill2_3",
    effect = "20315/FX_20315_skill2_3.prefab"
  },
  [42731551] = {
    id = 42731551,
    hurt_point = {
      "32:42731501:72031512",
      "42:42731502:72031512",
      "59:42731503:72031514"
    },
    spine_state = "skill3",
    effect = "20315/FX_20315_skill3.prefab",
    hit_effect_list = {
      "20315/FX_20315_skill3_hit_01.prefab",
      "20315/FX_20315_skill3_hit_01.prefab",
      "20315/FX_20315_skill3_hit_02.prefab"
    },
    sound = {
      72031508,
      72031509,
      72031510,
      72031511,
      72031513,
      72031515
    },
    warning_effect = {
      "1:31:Assets/Art/Effects/Prefab/battle/FX_battle_skill_range_circle_single.prefab"
    }
  },
  [42531751] = {
    id = 42531751,
    hurt_point = {
      "21:42531701:72031702"
    },
    spine_state = "skill1",
    effect = "20317/FX_20317_skill1.prefab",
    hit_effect = "20317/FX_20317_skill1_hit.prefab",
    sound = {
      72031701,
      72031703,
      72031704
    }
  },
  [42631751] = {
    id = 42631751,
    hurt_point = {
      "30:42631701:72031706"
    },
    spine_state = "skill2_1",
    effect = "20317/FX_20317_skill2_1.prefab",
    effect_target = "20317/FX_20317_skill2_1_target.prefab",
    sound = {
      72031705,
      72031707,
      72031708,
      72031709
    }
  },
  [42631761] = {
    id = 42631761,
    hurt_point = {
      "21:42631711:0"
    },
    spine_state = "skill2_2",
    effect = "20317/FX_20317_skill2_2.prefab"
  },
  [42631771] = {
    id = 42631771,
    hurt_point = {
      "44:42631721:0"
    },
    spine_state = "skill2_3",
    effect = "20317/FX_20317_skill2_3.prefab"
  },
  [42731751] = {
    id = 42731751,
    hurt_point = {
      "38:42731701:72031711"
    },
    spine_state = "skill3",
    effect = "20317/FX_20317_skill3.prefab",
    sound_target = {72031712},
    sound = {72031710, 72031713}
  },
  [42540151] = {
    id = 42540151,
    hurt_point = {
      "15:42540101:0"
    },
    spine_state = "skill1",
    effect = "20401/FX_20401_skill1.prefab",
    remote_effect = "10:20401/FX_20401_skill1_bullet.prefab",
    hit_effect = "20401/FX_20401_skill1_hit.prefab",
    sound = {72040101}
  },
  [42640151] = {
    id = 42640151,
    hurt_point = {
      "20:42640101:72040104",
      "27:42640102:72040104"
    },
    spine_state = "skill2",
    effect = "20401/FX_20401_skill2.prefab",
    remote_effect = "10:20401/FX_20401_skill2_bullet.prefab",
    hit_effect = "20401/FX_20401_skill2_hit.prefab",
    sound = {72040102, 72040103}
  },
  [42540251] = {
    id = 42540251,
    hurt_point = {
      "16:42540201:72040203"
    },
    spine_state = "skill1",
    effect = "20402/FX_20402_skill1.prefab",
    remote_effect = "100:20402/FX_20402_skill1_bullet.prefab",
    hit_effect = "20402/FX_20402_skill1_hit.prefab",
    sound = {72040201}
  },
  [42640251] = {
    id = 42640251,
    hurt_point = {
      "21:42640201:72040205"
    },
    spine_state = "skill2",
    effect = "20402/FX_20402_skill2.prefab",
    remote_effect = "100:20402/FX_20402_skill2_bullet.prefab",
    hit_effect = "20402/FX_20402_skill2_hit.prefab",
    sound = {72040203, 72040204}
  },
  [42540351] = {
    id = 42540351,
    hurt_point = {
      "23:42540301:72040303"
    },
    spine_state = "skill1",
    effect = "20403/FX_20403_skill1.prefab",
    remote_effect = "100:20403/FX_20403_skill1_bullet.prefab",
    hit_effect = "20403/FX_20403_skill1_hit.prefab",
    sound = {72040304}
  },
  [42640351] = {
    id = 42640351,
    hurt_point = {
      "24:42640301:72040305"
    },
    spine_state = "skill2",
    effect = "20403/FX_20403_skill2.prefab",
    remote_effect = "100:20403/FX_20403_skill2_bullet.prefab",
    hit_effect = "20403/FX_20403_skill2_hit.prefab",
    sound = {72040301, 72040302}
  },
  [42540451] = {
    id = 42540451,
    hurt_point = {
      "16:42540401:0"
    },
    spine_state = "skill1",
    effect = "20404/FX_20404_skill1.prefab",
    bullet_effect = "20404/FX_20404_skill2_bullet.prefab",
    bullet_hit_effect = "20404/FX_20404_skill1_hit.prefab",
    bullet_scale = 10000,
    sound = {72040401},
    bullet_sound = {72040402},
    bullet_hit_sound = {72040403},
    start_points = {"bullet_1"}
  },
  [42640451] = {
    id = 42640451,
    hurt_point = {
      "22:42640401:0",
      "22:42640402:0",
      "22:42640403:0"
    },
    spine_state = "skill2",
    effect = "20404/FX_20404_skill2.prefab",
    bullet_effect = "20404/FX_20404_skill2_bullet.prefab",
    bullet_hit_effect = "20404/FX_20404_skill2_hit.prefab",
    bullet_scale = 10000,
    sound = {
      72040404,
      72040405,
      72040406
    },
    bullet_sound = {72040407},
    bullet_hit_sound = {72040408},
    bend_scale = {
      1,
      0,
      -1
    },
    start_points = {
      "bullet_2",
      "bullet_2",
      "bullet_2"
    }
  },
  [42540551] = {
    id = 42540551,
    hurt_point = {
      "16:42540501:0",
      "21:42540502:0"
    },
    spine_state = "skill1",
    effect = "20405/FX_20405_skill1.prefab",
    bullet_effect = "20405/FX_20405_skill1_bullet.prefab",
    bullet_hit_effect = "20405/FX_20405_skill1_hit.prefab",
    bullet_scale = 10000,
    sound = {72040504, 72040505},
    bullet_sound = {72040506},
    bullet_hit_sound = {72040507},
    bend_scale = {1, -1}
  },
  [42640551] = {
    id = 42640551,
    hurt_point = {
      "27:42640501:0"
    },
    spine_state = "skill2",
    effect = "20405/FX_20405_skill2.prefab",
    bullet_effect = "20405/FX_20405_skill2_bullet.prefab",
    bullet_hit_effect = "20405/FX_20405_skill2_hit.prefab",
    bullet_scale = 10000,
    sound = {72040501},
    bullet_sound = {72040502},
    bullet_hit_sound = {72040503}
  },
  [42540651] = {
    id = 42540651,
    hurt_point = {
      "24:42540601:0"
    },
    spine_state = "skill1",
    effect = "20406/FX_20406_skill1.prefab",
    remote_effect = "10:20406/FX_20406_skill1_bullet.prefab",
    hit_effect = "20406/FX_20406_skill1_hit.prefab",
    sound = {72040601}
  },
  [42740651] = {
    id = 42740651,
    hurt_point = {
      "41:42740601:0"
    },
    spine_state = "skill3",
    effect = "20406/FX_20406_skill3.prefab",
    hit_effect = "20406/FX_20406_skill3_hit.prefab",
    effect_target = "20406/FX_20406_skill3_target.prefab",
    sound = {72040602},
    effect_target_limit = 1,
    warning_effect = {
      "1:40:Assets/Art/Effects/Prefab/battle/FX_battle_skill_range_circle.prefab"
    }
  },
  [42540751] = {
    id = 42540751,
    hurt_point = {
      "12:42540701:72040702"
    },
    spine_state = "skill1",
    effect = "20407/FX_20407_skill1.prefab",
    remote_effect = "100:20407/FX_20407_skill1_bullet.prefab",
    hit_effect = "20407/FX_20407_skill1_hit.prefab",
    sound = {72040701}
  },
  [42640751] = {
    id = 42640751,
    hurt_point = {
      "26:42640701:72040705"
    },
    spine_state = "skill2",
    effect = "20407/FX_20407_skill2.prefab",
    remote_effect = "100:20407/FX_20407_skill2_bullet.prefab",
    hit_effect = "20407/FX_20407_skill2_hit.prefab",
    sound = {72040703, 72040704}
  },
  [42540851] = {
    id = 42540851,
    hurt_point = {
      "28:42540801:0"
    },
    spine_state = "skill1",
    effect = "20408/FX_20408_skill1.prefab",
    effect_target = "20408/FX_20408_skill1_target.prefab",
    sound = {72040801}
  },
  [42740851] = {
    id = 42740851,
    hurt_point = {
      "34:42740801:0"
    },
    spine_state = "skill3",
    effect = "20408/FX_20408_skill3.prefab",
    hit_effect = "20408/FX_20408_skill3_hit.prefab",
    effect_target = "20408/FX_20408_skill3_target.prefab",
    sound = {72040802},
    warning_effect = {
      "1:33:Assets/Art/Effects/Prefab/battle/FX_battle_skill_range_circle_single.prefab"
    }
  },
  [42540951] = {
    id = 42540951,
    hurt_point = {
      "27:42540901:0"
    },
    spine_state = "skill1",
    effect = "20409/FX_20409_skill1.prefab",
    bullet_effect = "20409/FX_20409_skill1_bullet.prefab",
    bullet_hit_effect = "20409/FX_20409_skill1_hit.prefab",
    bullet_scale = 10000,
    sound = {72040901, 72040902},
    bullet_sound = {72040903},
    bullet_hit_sound = {72040904},
    bend_scale = {1}
  },
  [42740951] = {
    id = 42740951,
    hurt_point = {
      "42:42740901:72040907"
    },
    spine_state = "skill2",
    effect = "20409/FX_20409_skill2.prefab",
    effect_target = "20409/FX_20409_skill2_target.prefab",
    sound = {72040905, 72040906},
    warning_effect = {
      "1:41:Assets/Art/Effects/Prefab/battle/FX_battle_skill_range_circle_single.prefab"
    }
  },
  [42541051] = {
    id = 42541051,
    hurt_point = {
      "22:42541001:0"
    },
    spine_state = "skill1",
    effect = "20410/FX_20410_skill1.prefab",
    bullet_effect = "20410/FX_20410_skill1_bullet.prefab",
    bullet_hit_effect = "20410/FX_20410_skill1_hit.prefab",
    bullet_scale = 10000,
    sound = {72041001, 72041002},
    bullet_sound = {72041003},
    bullet_hit_sound = {72041004}
  },
  [42641051] = {
    id = 42641051,
    hurt_point = {
      "51:42641001:72041008",
      "62:42641002:72041008"
    },
    spine_state = "skill2",
    effect = "20410/FX_20410_skill2.prefab",
    hit_effect = "20410/FX_20410_skill2_hit.prefab",
    effect_line = "20410/FX_20410_skill2_line.prefab",
    sound = {
      72041005,
      72041006,
      72041007
    }
  },
  [42541151] = {
    id = 42541151,
    hurt_point = {
      "29:42541101:72041102"
    },
    spine_state = "skill1_1",
    effect = "20411/FX_20411_skill1_1.prefab",
    effect_target = "20411/FX_20411_skill1_1_target.prefab",
    sound = {72041101, 72041103}
  },
  [42541152] = {
    id = 42541152,
    hurt_point = {
      "29:42541101:72041105"
    },
    spine_state = "skill1_2",
    effect = "20411/FX_20411_skill1_2.prefab",
    remote_effect = "10:20411/FX_20411_skill1_2_bullet.prefab",
    hit_effect = "20411/FX_20411_skill1_2_hit.prefab",
    sound = {72041104, 72041106}
  },
  [42641151] = {
    id = 42641151,
    hurt_point = {
      "42:42641101:72041109"
    },
    spine_state = "skill2_1",
    effect = "20411/FX_20411_skill2_1.prefab",
    effect_target = "20411/FX_20411_skill2_1_target.prefab",
    sound = {72041107, 72041108}
  },
  [42641161] = {
    id = 42641161,
    hurt_point = {
      "30:42641111:0"
    },
    spine_state = "skill2_2",
    effect = "20411/FX_20411_skill2_2.prefab",
    hit_effect = "20411/FX_20411_skill2_2_hit.prefab",
    sound = {
      72041110,
      72041111,
      72041112
    },
    warning_effect = {
      "1:29:Assets/Art/Effects/Prefab/battle/FX_battle_skill_range_circle.prefab"
    }
  },
  [42641171] = {
    id = 42641171,
    hurt_point = {
      "43:42641121:0"
    },
    spine_state = "skill2_3",
    effect = "20411/FX_20411_skill2_3.prefab",
    effect_target = "20411/FX_20411_skill2_3_target.prefab",
    sound = {72041113}
  },
  [42741151] = {
    id = 42741151,
    hurt_point = {
      "50:42741101:0",
      "54:42741102:0",
      "58:42741103:0",
      "62:42741104:0",
      "66:42741105:0",
      "71:42741106:0",
      "75:42741107:0",
      "79:42741108:0"
    },
    spine_state = "skill3",
    effect = "20411/FX_20411_skill3.prefab",
    hit_effect = "20411/FX_20411_skill3_hit.prefab",
    sound = {
      72041114,
      72041115,
      72041116,
      72041117,
      72041118
    },
    warning_effect = {
      "1:49:Assets/Art/Effects/Prefab/battle/FX_battle_skill_range_rectangle.prefab"
    }
  },
  [42541251] = {
    id = 42541251,
    hurt_point = {
      "16:42541201:72041202",
      "29:42541202:72041204"
    },
    spine_state = "skill1_1",
    effect = "20411_1/FX_20411_1_skill1_1.prefab",
    hit_effect_list = {
      "20411_1/FX_20411_1_skill1_1_hit_01.prefab",
      "20411_1/FX_20411_1_skill1_1_hit_02.prefab"
    },
    sound = {72041201, 72041203}
  },
  [42541252] = {
    id = 42541252,
    hurt_point = {
      "16:42541201:72041202",
      "29:42541202:72041204"
    },
    spine_state = "skill1_2",
    effect = "20411_1/FX_20411_1_skill1_2.prefab",
    hit_effect_list = {
      "20411_1/FX_20411_1_skill1_2_hit_01.prefab",
      "20411_1/FX_20411_1_skill1_2_hit_02.prefab"
    },
    sound = {72041205, 72041206}
  },
  [42641251] = {
    id = 42641251,
    hurt_point = {
      "38:42641201:72041209"
    },
    spine_state = "skill2_1",
    effect = "20411_1/FX_20411_1_skill2_1.prefab",
    effect_target = "20411_1/FX_20411_1_skill2_1_hit.prefab",
    sound = {72041207, 72041208}
  },
  [42641261] = {
    id = 42641261,
    hurt_point = {
      "51:42641211:0",
      "58:42641212:0"
    },
    spine_state = "skill2_2",
    effect = "20411_1/FX_20411_1_skill2_2.prefab",
    hit_effect = "20411_1/FX_20411_1_skill2_2_hit.prefab",
    sound = {72041210, 72041211},
    warning_effect = {
      "1:50:Assets/Art/Effects/Prefab/battle/FX_battle_skill_range_circle.prefab"
    }
  },
  [42641271] = {
    id = 42641271,
    hurt_point = {
      "33:42641221:72041214"
    },
    spine_state = "skill2_3",
    effect = "20411_1/FX_20411_1_skill2_3.prefab",
    hit_effect = "20411_1/FX_20411_1_skill2_3_hit.prefab",
    sound = {72041212, 72041213}
  },
  [42741251] = {
    id = 42741251,
    hurt_point = {
      "1:42741201:0"
    },
    spine_state = "skill3",
    effect = "20411_1/FX_20411_1_skill3.prefab",
    bomb_effect_target = "20411_1/FX_20411_1_skill3_target.prefab",
    bomb_sound_target_hit = 72041217,
    sound = {72041215, 72041216}
  },
  [42550151] = {
    id = 42550151,
    hurt_point = {
      "25:42550101:72050102"
    },
    spine_state = "skill1",
    effect = "20501/FX_20501_skill1.prefab",
    remote_effect = "100:20501/FX_20501_skill1_bullet.prefab",
    hit_effect = "20501/FX_20501_skill1_hit.prefab",
    sound = {72050101}
  },
  [42650151] = {
    id = 42650151,
    hurt_point = {
      "17:42650101:72050106",
      "22:42650102:72050106",
      "48:42650103:72050106"
    },
    spine_state = "skill2",
    effect = "20501/FX_20501_skill2.prefab",
    remote_effect = "100:20501/FX_20501_skill2_bullet.prefab",
    hit_effect = "20501/FX_20501_skill2_hit.prefab",
    sound = {
      72050103,
      72050104,
      72050105
    }
  },
  [42550251] = {
    id = 42550251,
    hurt_point = {
      "29:42550201:72050202",
      "30:42550202:0"
    },
    spine_state = "skill1",
    effect = "20502/FX_20502_skill1.prefab",
    remote_effect = "100:20502/FX_20502_skill1_bullet.prefab",
    hit_effect = "20502/FX_20502_skill1_hit.prefab",
    sound = {72050201}
  },
  [42650251] = {
    id = 42650251,
    hurt_point = {
      "30:42650201:72050206",
      "35:42650202:72050206"
    },
    spine_state = "skill2",
    effect = "20502/FX_20502_skill2.prefab",
    remote_effect = "100:20502/FX_20502_skill2_bullet.prefab",
    hit_effect = "20502/FX_20502_skill2_hit.prefab",
    sound = {
      72050203,
      72050204,
      72050205
    }
  },
  [42550351] = {
    id = 42550351,
    hurt_point = {
      "17:42550301:72050303",
      "26:42550302:72050303"
    },
    spine_state = "skill1",
    effect = "20503/FX_20503_skill1.prefab",
    remote_effect = "100:20503/FX_20503_skill1_bullet.prefab",
    hit_effect = "20503/FX_20503_skill1_hit.prefab",
    sound = {72050301, 72050302}
  },
  [42650351] = {
    id = 42650351,
    hurt_point = {
      "30:42650301:72050305"
    },
    spine_state = "skill2",
    effect = "20503/FX_20503_skill2.prefab",
    remote_effect = "100:20503/FX_20503_skill2_bullet.prefab",
    hit_effect = "20503/FX_20503_skill2_hit.prefab",
    sound = {72050304}
  },
  [42550451] = {
    id = 42550451,
    hurt_point = {
      "22:42550401:0"
    },
    spine_state = "skill1",
    effect = "20504/FX_20504_skill1.prefab",
    bullet_effect = "20504/FX_20504_skill1_bullet.prefab",
    bullet_hit_effect = "20504/FX_20504_skill1_hit.prefab",
    bullet_scale = 10000,
    sound = {72050401, 72050402},
    bullet_sound = {72050403},
    bullet_hit_sound = {72050404}
  },
  [42650451] = {
    id = 42650451,
    hurt_point = {
      "22:42650401:72050407"
    },
    spine_state = "skill2",
    effect = "20504/FX_20504_skill2.prefab",
    hit_effect = "20504/FX_20504_skill2_hit.prefab",
    sound = {72050405, 72050406}
  },
  [42550551] = {
    id = 42550551,
    hurt_point = {
      "15:42550501:0"
    },
    spine_state = "skill1",
    effect = "20505/FX_20505_skill1.prefab",
    bullet_effect = "20505/FX_20505_skill1_bullet.prefab",
    bullet_hit_effect = "20505/FX_20505_skill1_hit.prefab",
    bullet_scale = 10000,
    sound = {72050501},
    bullet_sound = {72050502},
    bullet_hit_sound = {72050503},
    bend_scale = {1}
  },
  [42650551] = {
    id = 42650551,
    hurt_point = {
      "21:42650501:0"
    },
    spine_state = "skill2",
    effect = "20505/FX_20505_skill2.prefab",
    bullet_effect = "20505/FX_20505_skill2_bullet.prefab",
    bullet_hit_effect = "20505/FX_20505_skill2_hit.prefab",
    bullet_scale = 10000,
    sound = {72050504, 72050505},
    bullet_sound = {72050506},
    bullet_hit_sound = {72050507},
    bend_scale = {1}
  },
  [42550651] = {
    id = 42550651,
    hurt_point = {
      "17:42550601:0"
    },
    spine_state = "skill1",
    effect = "20506/FX_20506_skill1.prefab",
    remote_effect = "100:20506/FX_20506_skill1_bullet.prefab",
    hit_effect = "20506/FX_20506_skill1_hit.prefab"
  },
  [42650651] = {
    id = 42650651,
    hurt_point = {
      "12:42650601:0",
      "15:42650602:0",
      "19:42650603:0",
      "23:42650604:0",
      "27:42650605:0"
    },
    spine_state = "skill2",
    effect = "20506/FX_20506_skill2.prefab",
    hit_effect = "20506/FX_20506_skill2_hit.prefab"
  },
  [42550751] = {
    id = 42550751,
    hurt_point = {
      "18:42550701:72050701"
    },
    spine_state = "skill1",
    effect = "20507/FX_20507_skill1.prefab",
    remote_effect = "100:20507/FX_20507_skill1_bullet.prefab",
    hit_effect = "20507/FX_20507_skill1_hit.prefab",
    sound = {72050702}
  },
  [42750751] = {
    id = 42750751,
    hurt_point = {
      "25:42750701:0"
    },
    spine_state = "skill3",
    effect = "20507/FX_20507_skill3.prefab",
    effect_target = "20507/FX_20507_skill3_target.prefab",
    sound = {72050703, 72050704},
    effect_target_limit = 1,
    warning_effect = {
      "1:24:Assets/Art/Effects/Prefab/battle/FX_battle_skill_range_circle.prefab"
    }
  },
  [42550851] = {
    id = 42550851,
    hurt_point = {
      "14:42550801:72050802"
    },
    spine_state = "skill1",
    effect = "20508/FX_20508_skill1.prefab",
    remote_effect = "100:20508/FX_20508_skill1_bullet.prefab",
    hit_effect = "20508/FX_20508_skill1_hit.prefab",
    sound = {72050801}
  },
  [42650851] = {
    id = 42650851,
    hurt_point = {
      "14:42650801:72050807",
      "17:42650802:72050807",
      "22:42650803:72050807",
      "32:42650804:72050807"
    },
    spine_state = "skill2",
    effect = "20508/FX_20508_skill2.prefab",
    remote_effect = "100:20508/FX_20508_skill2_bullet.prefab",
    hit_effect = "20508/FX_20508_skill2_hit.prefab",
    sound = {
      72050803,
      72050804,
      72050805,
      72050806
    }
  },
  [42550951] = {
    id = 42550951,
    hurt_point = {
      "22:42550901:0"
    },
    spine_state = "skill1",
    effect = "20509/FX_20509_skill1.prefab",
    bullet_effect = "20509/FX_20509_skill1_bullet.prefab",
    bullet_hit_effect = "20509/FX_20509_skill1_hit.prefab",
    bullet_scale = 10000,
    sound = {72050901, 72050902},
    bullet_hit_sound = {72050903},
    bend_scale = {1}
  },
  [42750951] = {
    id = 42750951,
    hurt_point = {
      "32:42750901:0"
    },
    spine_state = "skill3",
    effect = "20509/FX_20509_skill3.prefab",
    bullet_effect = "20509/FX_20509_skill3_bullet.prefab",
    bullet_hit_effect = "20509/FX_20509_skill3_hit.prefab",
    bullet_scale = 10000,
    sound = {72050904, 72050905},
    bullet_hit_sound = {72050906},
    bend_scale = {1},
    warning_effect = {
      "1:31:Assets/Art/Effects/Prefab/battle/FX_battle_skill_range_circle_single.prefab"
    }
  },
  [42551051] = {
    id = 42551051,
    hurt_point = {
      "22:42551001:72051002"
    },
    spine_state = "skill1",
    effect = "20510/FX_20510_skill1.prefab",
    effect_target = "20510/FX_20510_skill1_target.prefab",
    sound = {72051001}
  },
  [42751051] = {
    id = 42751051,
    hurt_point = {
      "29:42751001:72051004",
      "33:42751002:72051004",
      "37:42751003:72051004",
      "40:42751004:72051004",
      "44:42751005:72051004"
    },
    spine_state = "skill3",
    effect = "20510/FX_20510_skill3.prefab",
    effect_target = "20510/FX_20510_skill3_target.prefab",
    sound = {72051003, 72051005},
    effect_target_limit = 1,
    warning_effect = {
      "1:28:Assets/Art/Effects/Prefab/battle/FX_battle_skill_range_circle.prefab"
    }
  },
  [42551151] = {
    id = 42551151,
    hurt_point = {
      "32:42551101:0"
    },
    spine_state = "skill1_1",
    effect = "20511/FX_20511_skill1_1.prefab",
    hit_effect = "20511/FX_20511_skill1_1_hit.prefab"
  },
  [42551152] = {
    id = 42551152,
    hurt_point = {
      "32:42551101:0"
    },
    spine_state = "skill1_2",
    effect = "20511/FX_20511_skill1_2.prefab",
    hit_effect = "20511/FX_20511_skill1_2_hit.prefab"
  },
  [42651151] = {
    id = 42651151,
    hurt_point = {
      "44:42651101:0"
    },
    spine_state = "skill2",
    effect = "20511/FX_20511_skill2.prefab",
    effect_target = "20511/FX_20511_skill2_target.prefab"
  },
  [42751151] = {
    id = 42751151,
    hurt_point = {
      "55:42751101:0"
    },
    spine_state = "skill3",
    effect = "20511/FX_20511_skill3.prefab",
    effect_target = "20511/FX_20511_skill3_target.prefab",
    bullet_effect = "10007/FX_10007_skill1_bullet.prefab",
    bullet_hit_effect = "10007/FX_10007_skill1_hit.prefab",
    bullet_scale = 10000
  },
  [42560151] = {
    id = 42560151,
    hurt_point = {
      "17:42560101:0"
    },
    spine_state = "skill1"
  },
  [42660151] = {
    id = 42660151,
    hurt_point = {
      "17:42660101:0"
    },
    spine_state = "skill2"
  },
  [42760151] = {
    id = 42760151,
    hurt_point = {
      "15:42760101:0"
    },
    spine_state = "skill3"
  },
  [42560251] = {
    id = 42560251,
    hurt_point = {
      "17:42560201:0"
    },
    spine_state = "skill1"
  },
  [42660251] = {
    id = 42660251,
    hurt_point = {
      "17:42660201:0"
    },
    spine_state = "skill2"
  },
  [42760251] = {
    id = 42760251,
    hurt_point = {
      "15:42760201:0"
    },
    spine_state = "skill3"
  },
  [42570151] = {
    id = 42570151,
    hurt_point = {
      "10:42570101:0"
    },
    spine_state = "skill1"
  },
  [42570251] = {
    id = 42570251,
    hurt_point = {
      "14:42570201:0"
    },
    spine_state = "skill1",
    effect = "20702/FX_20702_skill1.prefab",
    hit_effect = "20702/FX_20702_skill1_hit.prefab"
  },
  [42570351] = {
    id = 42570351,
    hurt_point = {
      "23:42570301:0"
    },
    spine_state = "skill1"
  },
  [42670351] = {
    id = 42670351,
    hurt_point = {
      "41:42670301:0"
    },
    spine_state = "skill2"
  },
  [42570451] = {
    id = 42570451,
    hurt_point = {
      "16:42570401:0"
    },
    spine_state = "skill1",
    bullet_effect = "10007/FX_10007_skill1_bullet.prefab",
    bullet_hit_effect = "10007/FX_10007_skill1_hit.prefab",
    bullet_scale = 10000,
    bend_scale = {1}
  },
  [42670451] = {
    id = 42670451,
    hurt_point = {
      "21:42670401:0"
    },
    spine_state = "skill2"
  },
  [42570551] = {
    id = 42570551,
    hurt_point = {
      "15:42570501:0"
    },
    spine_state = "skill1_1"
  },
  [42570552] = {
    id = 42570552,
    hurt_point = {
      "15:42570501:0"
    },
    spine_state = "skill1_2"
  },
  [42570751] = {
    id = 42570751,
    hurt_point = {
      "25:42570701:72070702"
    },
    spine_state = "skill1",
    effect = "20707/FX_20707_skill1.prefab",
    hit_effect = "20707/FX_20707_skill1_hit.prefab",
    sound = {72070701},
    end_points = {"hit"}
  },
  [42670751] = {
    id = 42670751,
    hurt_point = {
      "26:42670701:0",
      "31:42670702:0",
      "36:42670703:0",
      "42:42670704:0",
      "47:42670705:0"
    },
    spine_state = "skill2",
    effect = "20707/FX_20707_skill2.prefab",
    hit_effect = "20707/FX_20707_skill2_hit.prefab",
    effect_target = "20707/FX_20707_skill2_target.prefab",
    sound_target = {72070704},
    sound = {72070703},
    effect_target_limit = 1,
    warning_effect = {
      "1:25:Assets/Art/Effects/Prefab/battle/FX_battle_skill_range_circle.prefab"
    }
  },
  [42570851] = {
    id = 42570851,
    hurt_point = {
      "25:42570801:72070802"
    },
    spine_state = "skill1",
    effect = "20708/FX_20708_skill1.prefab",
    hit_effect = "20708/FX_20708_skill1_hit.prefab",
    sound = {72070801},
    end_points = {"hit"}
  },
  [42670851] = {
    id = 42670851,
    hurt_point = {
      "25:42670801:0"
    },
    spine_state = "skill2",
    effect = "20708/FX_20708_skill2.prefab",
    sound = {72070803}
  },
  [42570951] = {
    id = 42570951,
    hurt_point = {
      "25:42570901:72070902"
    },
    spine_state = "skill1",
    effect = "20709/FX_20709_skill1.prefab",
    hit_effect = "20709/FX_20709_skill1_hit.prefab",
    sound = {72070901},
    end_points = {"hit"}
  },
  [42670951] = {
    id = 42670951,
    hurt_point = {
      "30:42670901:0",
      "33:42670902:0",
      "36:42670903:0",
      "40:42670904:0",
      "44:42670905:0",
      "49:42670906:0"
    },
    spine_state = "skill2",
    effect = "20709/FX_20709_skill2.prefab",
    effect_target = "20709/FX_20709_skill2_target.prefab",
    sound_target = {72070904},
    sound = {72070903}
  },
  [42571051] = {
    id = 42571051,
    hurt_point = {
      "25:42571001:72070702"
    },
    spine_state = "skill1",
    effect = "20707/FX_20707_skill1.prefab",
    hit_effect = "20707/FX_20707_skill1_hit.prefab",
    end_points = {"hit"}
  },
  [42671051] = {
    id = 42671051,
    hurt_point = {
      "26:42671001:0",
      "31:42671002:0",
      "36:42671003:0",
      "42:42671004:0",
      "47:42671005:0"
    },
    spine_state = "skill2",
    effect = "20707/FX_20707_skill2.prefab",
    hit_effect = "20707/FX_20707_skill2_hit.prefab",
    effect_target = "20707/FX_20707_skill2_target.prefab",
    sound_target = {72070704},
    effect_target_limit = 1
  },
  [42571151] = {
    id = 42571151,
    hurt_point = {
      "25:42571101:72070802"
    },
    spine_state = "skill1",
    effect = "20708/FX_20708_skill1.prefab",
    hit_effect = "20708/FX_20708_skill1_hit.prefab",
    end_points = {"hit"}
  },
  [42671151] = {
    id = 42671151,
    hurt_point = {
      "25:42671101:0"
    },
    spine_state = "skill2",
    effect = "20708/FX_20708_skill2.prefab"
  },
  [42571251] = {
    id = 42571251,
    hurt_point = {
      "25:42571201:72070902"
    },
    spine_state = "skill1",
    effect = "20709/FX_20709_skill1.prefab",
    hit_effect = "20709/FX_20709_skill1_hit.prefab",
    end_points = {"hit"}
  },
  [42671251] = {
    id = 42671251,
    hurt_point = {
      "30:42671201:0",
      "33:42671202:0",
      "36:42671203:0",
      "40:42671204:0",
      "44:42671205:0",
      "49:42671206:0"
    },
    spine_state = "skill2",
    effect = "20709/FX_20709_skill2.prefab",
    effect_target = "20709/FX_20709_skill2_target.prefab",
    sound_target = {72070904}
  },
  [42571351] = {
    id = 42571351,
    hurt_point = {
      "20:42571301:0"
    },
    spine_state = "skill2",
    effect = "20713/FX_20713_skill2.prefab",
    sound = {71016116}
  },
  [42671351] = {
    id = 42671351,
    hurt_point = {
      "16:42671301:0"
    },
    spine_state = "skill1",
    effect = "20713/FX_20713_skill1.prefab",
    bullet_effect = "20713/FX_20713_skill1_bullet.prefab",
    bullet_hit_effect = "20713/FX_20713_skill1_hit.prefab",
    bullet_scale = 10000,
    sound = {71016117},
    bullet_hit_sound = {71016118},
    start_points = {"bullet_1"}
  },
  [42571451] = {
    id = 42571451,
    hurt_point = {
      "20:42571401:0"
    },
    spine_state = "skill1",
    effect = "20713_1/FX_20713_1_skill2.prefab",
    sound = {71116116}
  },
  [42671451] = {
    id = 42671451,
    hurt_point = {
      "16:42671401:0"
    },
    spine_state = "skill2",
    effect = "20713_1/FX_20713_1_skill1.prefab",
    bullet_effect = "20713_1/FX_20713_1_skill1_bullet.prefab",
    bullet_hit_effect = "20713_1/FX_20713_1_skill1_hit.prefab",
    bullet_scale = 10000,
    sound = {71116117},
    bullet_hit_sound = {71116118},
    start_points = {"bullet_1"}
  },
  [42571551] = {
    id = 42571551,
    hurt_point = {
      "55:42571501:0",
      "60:42571502:0",
      "65:42571503:0",
      "70:42571504:0",
      "75:42571505:0",
      "83:42571506:0"
    },
    effect = "20016/FX_20016_buffskill.prefab",
    hit_effect = "20016/FX_20016_skill3_hit.prefab",
    end_points = {"hit"}
  },
  [42580151] = {
    id = 42580151,
    hurt_point = {
      "15:42580101:72080102"
    },
    spine_state = "skill1",
    effect = "20801/FX_20801_skill1.prefab",
    remote_effect = "100:20801/FX_20801_skill1_bullet.prefab",
    hit_effect = "20801/FX_20801_skill1_hit.prefab",
    sound = {72080101}
  },
  [42680151] = {
    id = 42680151,
    hurt_point = {
      "41:42680101:72080104"
    },
    spine_state = "skill2_1",
    effect = "20801/FX_20801_skill2_1.prefab",
    hit_effect = "20801/FX_20801_skill2_1_hit.prefab",
    sound = {72080103}
  },
  [42680161] = {
    id = 42680161,
    hurt_point = {
      "25:42680111:0",
      "28:42680112:0"
    },
    spine_state = "skill2_2",
    effect = "20801/FX_20801_skill2_2.prefab",
    hit_effect = "20801/FX_20801_skill2_2_hit.prefab",
    effect_target = "20801/FX_20801_skill2_2_target.prefab",
    sound = {72080105},
    warning_effect = {
      "1:24:Assets/Art/Effects/Prefab/battle/FX_battle_skill_range_circle.prefab"
    }
  },
  [42780151] = {
    id = 42780151,
    hurt_point = {
      "39:42780101:0",
      "41:42780102:0",
      "43:42780103:0",
      "45:42780104:0",
      "48:42780105:0"
    },
    spine_state = "skill3",
    effect = "20801/FX_20801_skill3.prefab",
    hit_effect = "20801/FX_20801_skill3_hit.prefab",
    sound = {72080106}
  },
  [42580251] = {
    id = 42580251,
    hurt_point = {
      "39:42580201:0"
    },
    spine_state = "skill1",
    effect = "20802/FX_20802_skill1.prefab",
    bullet_effect = "20802/FX_20802_skill1_bullet.prefab",
    bullet_hit_effect = "20802/FX_20802_skill1_hit.prefab",
    bullet_scale = 10000,
    sound = {72080201, 72080202},
    bullet_hit_sound = {72080203},
    bend_scale = {1}
  },
  [42680251] = {
    id = 42680251,
    hurt_point = {
      "56:42680201:0"
    },
    spine_state = "skill2_1",
    effect = "20802/FX_20802_skill2_1.prefab",
    effect_target = "20802/FX_20802_skill2_1_target.prefab",
    sound_target = {72080206},
    sound = {72080204, 72080205}
  },
  [42680261] = {
    id = 42680261,
    hurt_point = {
      "49:42680211:0",
      "53:42680212:0",
      "56:42680213:0",
      "59:42680214:0"
    },
    spine_state = "skill2_2",
    effect = "20802/FX_20802_skill2_2.prefab",
    bullet_effect = "20802/FX_20802_skill2_2_bullet.prefab",
    bullet_hit_effect = "20802/FX_20802_skill2_2_hit.prefab",
    bullet_scale = 10000,
    bullet_sound = {72080208},
    bullet_hit_sound = {72080209},
    bend_scale = {
      1,
      1,
      1,
      1
    },
    start_points = {
      "bullet_2",
      "bullet_3",
      "bullet_4",
      "bullet_5"
    }
  },
  [42780251] = {
    id = 42780251,
    hurt_point = {
      "43:42780201:0",
      "61:42780202:0"
    },
    spine_state = "skill3",
    effect = "20802/FX_20802_skill3.prefab",
    effect_target = "20802/FX_20802_skill3_target.prefab",
    sound_target = {72080212},
    sound = {72080210, 72080211}
  },
  [42580351] = {
    id = 42580351,
    hurt_point = {
      "30:42580301:0"
    },
    spine_state = "skill1_1",
    effect = "20803/FX_20803_skill1.prefab",
    effect_target = "20803/FX_20803_skill1_target.prefab",
    sound_target = {72080303},
    sound = {72080301, 72080302}
  },
  [42580352] = {
    id = 42580352,
    hurt_point = {
      "30:42580301:72020804"
    },
    spine_state = "skill1_2",
    effect = "20803/FX_20803_skill1.prefab",
    effect_target = "20803/FX_20803_skill1_target.prefab",
    sound_target = {72080306},
    sound = {72080304, 72080305}
  },
  [42680351] = {
    id = 42680351,
    hurt_point = {
      "30:42680301:0"
    },
    spine_state = "skill2_1",
    effect = "20803/FX_20803_skill2_1.prefab",
    effect_target = "20803/FX_20803_skill2_1_target.prefab",
    sound_target = {72080309},
    sound = {72080307, 72080308}
  },
  [42680361] = {
    id = 42680361,
    hurt_point = {
      "32:42680311:0"
    },
    spine_state = "skill2_2",
    effect = "20803/FX_20803_skill2_2.prefab",
    effect_target = "20803/FX_20803_skill2_2_target.prefab",
    sound_target = {72080312},
    sound = {72080310, 72080311},
    warning_effect = {
      "1:31:Assets/Art/Effects/Prefab/battle/FX_battle_skill_range_circle.prefab"
    }
  },
  [42780351] = {
    id = 42780351,
    hurt_point = {
      "30:42780301:0"
    },
    spine_state = "skill3",
    effect = "20803/FX_20803_skill3.prefab",
    effect_target = "20803/FX_20803_skill3_target.prefab",
    sound_target = {72080315},
    sound = {72080313, 72080314}
  },
  [42580451] = {
    id = 42580451,
    hurt_point = {
      "31:42580401:72080402"
    },
    spine_state = "skill1",
    effect = "20804/FX_20804_skill1.prefab",
    hit_effect = "20804/FX_20804_skill1_hit.prefab",
    sound = {72080401}
  },
  [42680451] = {
    id = 42680451,
    hurt_point = {
      "31:42680401:0",
      "46:42680402:0"
    },
    spine_state = "skill2_1",
    effect = "20804/FX_20804_skill2_1.prefab",
    effect_target = "20804/FX_20804_skill2_1_target.prefab",
    sound_target = {72080404},
    sound = {72080403}
  },
  [42680461] = {
    id = 42680461,
    hurt_point = {
      "30:42680411:0"
    },
    spine_state = "skill2_2",
    effect = "20804/FX_20804_skill2_2.prefab",
    bullet_effect = "20804/FX_20804_skill2_2_bullet.prefab",
    bullet_scale = 10000,
    sound = {72080405},
    bullet_hit_sound = {72080406},
    bend_scale = {1}
  },
  [42780451] = {
    id = 42780451,
    hurt_point = {
      "43:42780401:0"
    },
    spine_state = "skill3",
    effect = "20804/FX_20804_skill3.prefab",
    hit_effect = "20804/FX_20804_skill3_hit.prefab",
    sound = {72080407, 72080408},
    warning_effect = {
      "1:42:Assets/Art/Effects/Prefab/battle/FX_battle_skill_range_circle.prefab"
    }
  },
  [42580551] = {
    id = 42580551,
    hurt_point = {
      "20:42580501:72080502"
    },
    spine_state = "skill1",
    effect = "20805/FX_20805_skill1.prefab",
    remote_effect = "100:20805/FX_20805_skill1_bullet.prefab",
    hit_effect = "20805/FX_20805_skill1_hit.prefab",
    sound = {42580551},
    end_points = {"hit"}
  },
  [42680551] = {
    id = 42680551,
    hurt_point = {
      "28:42680501:72080504"
    },
    spine_state = "skill2_1",
    effect = "20805/FX_20805_skill2_1.prefab",
    hit_effect = "20805/FX_20805_skill2_1_hit.prefab",
    sound = {42680551}
  },
  [42680561] = {
    id = 42680561,
    hurt_point = {
      "31:42680511:72080506"
    },
    spine_state = "skill2_2",
    effect = "20805/FX_20805_skill2_2.prefab",
    effect_target = "20805/FX_20805_skill2_2_target.prefab",
    effect_line = "20805/FX_20805_skill2_2_line.prefab",
    sound = {42680561}
  },
  [42680571] = {
    id = 42680571,
    hurt_point = {
      "21:42680521:72080508",
      "40:42680522:72080508"
    },
    spine_state = "skill2_3",
    effect = "20805/FX_20805_skill2_3.prefab",
    effect_target = "20805/FX_20805_skill2_3_target.prefab",
    sound = {42680571}
  },
  [42780551] = {
    id = 42780551,
    hurt_point = {
      "62:42780501:0"
    },
    spine_state = "skill3",
    effect = "20805/FX_20805_skill3.prefab",
    effect_target = "20805/FX_20805_skill3_target.prefab",
    effect_line = "20805/FX_20805_skill3_line.prefab",
    sound = {
      72080509,
      72080510,
      72080511
    }
  },
  [42590451] = {
    id = 42590451,
    hurt_point = {
      "24:42590401:0"
    },
    spine_state = "skill1",
    effect = "20904/FX_20904_skill1.prefab",
    hit_effect = "20904/FX_20904_skill1_hit.prefab",
    sound = {72090401}
  },
  [42690451] = {
    id = 42690451,
    hurt_point = {
      "28:42690401:0"
    },
    spine_state = "skill2_1",
    effect = "20904/FX_20904_skill2_1.prefab",
    hit_effect = "20904/FX_20904_skill2_1_hit.prefab",
    sound = {72090402}
  },
  [42690461] = {
    id = 42690461,
    hurt_point = {
      "32:42690411:0"
    },
    spine_state = "skill2_2",
    effect = "20904/FX_20904_skill2_2.prefab",
    hit_effect = "20904/FX_20904_skill2_2_hit.prefab",
    sound = {72090403, 72090404},
    warning_effect = {
      "1:31:Assets/Art/Effects/Prefab/battle/FX_battle_skill_range_rectangle.prefab"
    }
  },
  [42690471] = {
    id = 42690471,
    hurt_point = {
      "27:42690421:0"
    },
    spine_state = "skill2_3",
    effect = "20904/FX_20904_skill2_3.prefab",
    sound = {72090405}
  },
  [42790451] = {
    id = 42790451,
    hurt_point = {
      "49:42790401:0"
    },
    spine_state = "skill3",
    effect = "20904/FX_20904_skill3.prefab",
    hit_effect = "20904/FX_20904_skill3_hit.prefab",
    effect_line = "20904/FX_20904_skill3_line.prefab",
    sound = {72090406, 72090407}
  },
  [42590651] = {
    id = 42590651,
    hurt_point = {
      "33:42590601:0"
    },
    spine_state = "skill1",
    effect = "20906/FX_20906_skill1.prefab",
    bullet_effect = "20906/FX_20906_skill1_bullet.prefab",
    bullet_hit_effect = "20906/FX_20906_skill1_hit.prefab",
    bullet_scale = 10000,
    sound = {
      72090601,
      72090602,
      72090603
    },
    bullet_hit_sound = {72090604}
  },
  [42690651] = {
    id = 42690651,
    hurt_point = {
      "41:42690601:0"
    },
    spine_state = "skill2_1",
    effect = "20906/FX_20906_skill2_1.prefab",
    hit_effect = "20906/FX_20906_skill2_1_hit.prefab",
    sound = {72090605, 72090606},
    warning_effect = {
      "1:40:Assets/Art/Effects/Prefab/battle/FX_battle_skill_range_circle.prefab"
    }
  },
  [42690661] = {
    id = 42690661,
    hurt_point = {
      "50:42690611:0"
    },
    spine_state = "skill2_2",
    effect = "20906/FX_20906_skill2_2.prefab",
    bullet_effect = "20906/FX_20906_skill2_2_bullet.prefab",
    bullet_hit_effect = "20906/FX_20906_skill2_2_hit.prefab",
    bullet_scale = 10000,
    sound = {
      72090607,
      72090608,
      72090609
    },
    bullet_hit_sound = {72090610}
  },
  [42690671] = {
    id = 42690671,
    hurt_point = {
      "49:42690621:0"
    },
    spine_state = "skill2_3",
    effect = "20906/FX_20906_skill2_3.prefab",
    sound = {72090611, 72090612}
  },
  [42790651] = {
    id = 42790651,
    hurt_point = {
      "87:42790601:0",
      "94:42790602:0",
      "102:42790603:0",
      "111:42790604:0",
      "119:42790605:0"
    },
    spine_state = "skill3",
    effect = "20906/FX_20906_skill3.prefab",
    bullet_effect = "20906/FX_20906_skill3_bullet.prefab",
    bullet_hit_effect = "20906/FX_20906_skill3_hit.prefab",
    bullet_scale = 10000,
    sound = {
      72090613,
      72090614,
      72090615,
      72090616,
      72090617,
      72090618
    },
    bullet_hit_sound = {72090619},
    bend_scale = {
      0,
      0,
      0,
      0,
      0
    }
  },
  [42591051] = {
    id = 42591051,
    hurt_point = {
      "42:42591001:72091003"
    },
    spine_state = "skill1",
    effect = "20910/FX_20910_skill1.prefab",
    effect_points = {"bullet_1"},
    hit_effect = "20910/FX_20910_skill1_hit.prefab",
    sound = {72091001, 72091002}
  },
  [42691051] = {
    id = 42691051,
    hurt_point = {
      "64:42691001:72091006"
    },
    spine_state = "skill2_1",
    effect = "20910/FX_20910_skill2_1.prefab",
    hit_effect = "20910/FX_20910_skill2_1_hit.prefab",
    sound = {72091004, 72091005},
    start_points = {"bullet_3"}
  },
  [42691061] = {
    id = 42691061,
    hurt_point = {
      "36:42691011:72091009"
    },
    spine_state = "skill2_2",
    effect = "20910/FX_20910_skill2_2.prefab",
    hit_effect = "20910/FX_20910_skill2_2_hit.prefab",
    sound = {72091007, 72091008},
    warning_effect = {
      "1:35:Assets/Art/Effects/Prefab/battle/FX_battle_skill_range_rectangle.prefab"
    }
  },
  [42691071] = {
    id = 42691071,
    hurt_point = {
      "50:42691021:0"
    },
    spine_state = "skill2_3",
    effect = "20910/FX_20910_skill2_3.prefab",
    effect_points = {"bullet_3"},
    bullet_effect = "20910/FX_20910_skill2_3_bullet.prefab",
    bullet_hit_effect = "20910/FX_20910_skill2_3_hit.prefab",
    bullet_scale = 10000,
    sound = {
      72091010,
      72091011,
      72091012
    },
    bullet_hit_sound = {72091013},
    start_points = {"bullet_3"}
  },
  [42791051] = {
    id = 42791051,
    hurt_point = {
      "1:42791001:0"
    },
    spine_state = "skill3",
    effect = "20910/FX_20910_skill3.prefab",
    effect_points = {"bullet_2"},
    bomb_effect_target = "20910/FX_20910_skill3_target.prefab",
    bomb_sound_target = 72091015,
    sound = {72091014}
  },
  [42595051] = {
    id = 42595051,
    hurt_point = {
      "42:42595001:72095003"
    },
    spine_state = "skill1",
    effect = "20910/FX_20910_skill1.prefab",
    effect_points = {"bullet_1"},
    hit_effect = "20910/FX_20910_skill1_hit.prefab",
    sound = {72095001, 72095002}
  },
  [42695051] = {
    id = 42695051,
    hurt_point = {
      "64:42695001:72095006"
    },
    spine_state = "skill2_1",
    effect = "20910/FX_20910_skill2_1.prefab",
    hit_effect = "20910/FX_20910_skill2_1_hit.prefab",
    sound = {72095004, 72095005},
    start_points = {"bullet_3"}
  },
  [42695061] = {
    id = 42695061,
    hurt_point = {
      "36:42695011:72095009"
    },
    spine_state = "skill2_2",
    effect = "20910/FX_20910_1_skill2_2.prefab",
    hit_effect = "20910/FX_20910_skill2_2_hit.prefab",
    sound = {72095007, 72095008},
    warning_effect = {
      "1:35:Assets/Art/Effects/Prefab/battle/FX_battle_skill_range_rectangle.prefab"
    }
  },
  [42695071] = {
    id = 42695071,
    hurt_point = {
      "50:42695021:0"
    },
    spine_state = "skill2_3",
    effect = "20910/FX_20910_skill2_3.prefab",
    effect_points = {"bullet_3"},
    bullet_effect = "20910/FX_20910_skill2_3_bullet.prefab",
    bullet_hit_effect = "20910/FX_20910_skill2_3_hit.prefab",
    bullet_scale = 10000,
    sound = {
      72095010,
      72095011,
      72095012
    },
    bullet_hit_sound = {72095013},
    start_points = {"bullet_3"}
  },
  [42795051] = {
    id = 42795051,
    hurt_point = {
      "1:42795001:0"
    },
    spine_state = "skill3",
    effect = "20910/FX_20910_skill3.prefab",
    effect_points = {"bullet_2"},
    bomb_effect_target = "20910/FX_20910_skill3_target.prefab",
    bomb_sound_target = 72095015,
    sound = {72095014}
  },
  [42801011] = {
    id = 42801011,
    hurt_point = {
      "9:42801011:0"
    },
    bullet_effect = "31003/FX_31003_bullet.prefab",
    bullet_hit_effect = "31003/FX_31003_hit.prefab",
    bullet_scale = 10000,
    sound = {73100303},
    bullet_sound = {73100301},
    bullet_hit_sound = {73100302},
    bend_scale = {1}
  },
  [42802011] = {
    id = 42802011,
    hurt_point = {
      "10:42802011:71011608"
    },
    spine_state = "skill1",
    effect = "32001/FX_32001_skill1.prefab",
    hit_effect = "32001/FX_32001_skill1_hit.prefab",
    sound = {71011608},
    end_points = {"hit"}
  },
  [42802012] = {
    id = 42802012,
    hurt_point = {
      "10:42802012:71011608"
    },
    spine_state = "skill1",
    effect = "32001_1/FX_32001_1_skill1.prefab",
    hit_effect = "32001_1/FX_32001_1_skill1_hit.prefab",
    end_points = {"hit"}
  }
}
