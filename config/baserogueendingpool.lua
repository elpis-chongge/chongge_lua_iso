BaseRogueEndingPool = {
  [5130101] = {
    id = 5130101,
    group_id = 101,
    stage_id = 51100321,
    priority = 1,
    ending_id = 50806101
  },
  [5130102] = {
    id = 5130102,
    group_id = 101,
    open_condition = {
      "103:140003403:140003406:140003409",
      "102:50806101"
    },
    stage_id = 51100322,
    priority = 2,
    ending_id = 50806102
  },
  [5130103] = {
    id = 5130103,
    group_id = 101,
    open_condition = {
      "101:140002305",
      "102:50806102"
    },
    stage_id = 51100321,
    priority = 3,
    ending_id = 50806103
  },
  [5130104] = {
    id = 5130104,
    group_id = 101,
    open_condition = {
      "101:140002305",
      "101:140004905",
      "102:50806103"
    },
    stage_id = 51100322,
    priority = 4,
    hide_chapter_tag = 1
  },
  [5130105] = {
    id = 5130105,
    group_id = 102,
    stage_id = 51100331,
    priority = 1,
    ending_id = 50806104
  }
}
